#!/bin/sh
xinput list | sed -ne 's/^[^ ][^V].*id=\([0-9]*\).*/\1/p' | while read id
do
        case `xinput list-props $id` in
        *"Middle Button Emulation"*)
                xinput set-int-prop $id "Evdev Wheel Emulation" 8 1
                xinput set-int-prop $id "Evdev Wheel Emulation Button" 8 2
                #xinput set-int-prop $id "Evdev Wheel Emulation Timeout" 8 200
                xinput set-int-prop $id "Evdev Wheel Emulation Axes" 8 6 7 4 5
                xinput set-int-prop $id "Evdev Middle Button Emulation" 8 0
                ;;
        esac
done
