# $FreeBSD: releng/12.1/share/skel/dot.login 320672 2017-07-05 13:08:07Z trasz $
#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# See also csh(1), environ(7).
#

# Query terminal size; useful for serial lines.
if ( -x /usr/bin/resizewin ) /usr/bin/resizewin -z

# Display a random cookie on each login.
if ( -x /usr/bin/fortune ) /usr/bin/fortune freebsd-tips

# http://www-pnp.physics.ox.ac.uk/~gronbech/computing_course/node242.html
if ( ! $?SSH_AUTH_SOCK ) then
  eval `ssh-agent -c`
  ssh-add
endif
