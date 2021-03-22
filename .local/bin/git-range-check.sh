#!/bin/sh
###########################################################################
#
#  Copyright 2016-2020, ARM Limited, All Rights Reserved
#  SPDX-License-Identifier: Apache-2.0
#
#  Licensed under the Apache License, Version 2.0 (the "License"); you may
#  not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
###########################################################################

# Check if all commits since a specified commit (not including that commit)
# build and pass some basic checks.

set -e

ORIGIN=origin/master
BRANCH=$(git rev-parse --abbrev-ref HEAD)
STATUS=0

test_this_commit() {
    set -x

    tox -e linting -e py37
    STATUS=$?

    set +x

    return $STATUS
}


usage() {
    echo "Usage: ./$(basename $0) [<origin-branch>]"
    echo "    <origin-branch> The branch to test back to (defaults to $ORIGIN)"
}

if test $# -gt 1; then
    # There are too many arguments. Show help and exit with an error.
    usage
    exit 1
elif test $# -ge 1; then
    # The optional <origin-branch> argument is present. Replace the default
    # value of ORIGIN with the <origin-branch> argument.
    ORIGIN=$1
fi

# Check for detached head
if [ "$BRANCH" = "HEAD" ]; then
    echo "Please make a branch to run this script from. This script moves"
    echo "around in history and needs a way back to the starting point."
    exit 1
fi

# Check for modified or untracked files
MODIFIED=$(git status --porcelain=v1 2>/dev/null)
if [ "$MODIFIED" != "" ]; then
    echo "You currently have changed or untracked files. These may interfere"
    echo "with this script's tests which may not limit themselves only to"
    echo "tracked files."
    exit 1
fi

# Come up with the list of commits between the ORIGIN and HEAD, starting from
# the oldest commit.
COMMITS=$(git rev-list --reverse $ORIGIN..HEAD)

# Test each commit with make clean and make.
echo "$COMMITS"
for COMMIT in $COMMITS; do
    git checkout $COMMIT

    if ! test_this_commit; then
        echo >&2 $COMMIT - failed
        echo >&2 Returning to $BRANCH
        break
    fi
done

# Go back to the original starting point, to avoid leaving the user in detached
# HEAD state.
cleanup() {
	git checkout $BRANCH
}
trap 'cleanup; exit $STATUS' EXIT
trap 'trap - HUP; cleanup; kill -HUP $$'  HUP
trap 'trap - INT; cleanup; kill -INT $$'  INT
trap 'trap - TERM; cleanup; kill -TERM $$'  TERM

exit $STATUS
