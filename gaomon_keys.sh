#!/bin/bash

# @speculatrix's M106Kpro has a different usb device id which isn't
# recognised by linux, different from @bigbigmdm's tablet who wrote
# this originally and saw these devices:
#devname_pad="GAOMON Gaomon Tablet Pad pad"
#devname_stylus="GAOMON Gaomon Tablet Pad stylus"

# so @speculatrix rewrote this to work out the device name automatically...
devname_pad=$( xsetwacom list devices | sed -e 's/[[:space:]]*id.*//g' | grep 'Pad pad')
devname_stylus=$( xsetwacom list devices | sed -e 's/[[:space:]]*id.*//g' | grep 'Pen stylus')

# buttons layout, with USB connector on left
# ___________
# |  1 |  2 |
# |  3 |  8 |
# |  9 | 10 |
# -----------
# ___________
# | 11 | 12 |
# | 13 | 14 |
# | 15 | 16 |
# -----------

# Note: comments reflect GIMP shortcuts, most work for Krita except export

# TABLET BUTTON SETTINGS
xsetwacom --set "$devname_pad" Button 1 "key +ctrl - -ctrl"			# zoom out
xsetwacom --set "$devname_pad" Button 2 "key +ctrl +shift + -shift -ctrl"	# zoom in
xsetwacom --set "$devname_pad" Button 3 "key +ctrl c -ctrl"			# copy
xsetwacom --set "$devname_pad" Button 8 "key +ctrl v -ctrl"			# paste
xsetwacom --set "$devname_pad" Button 9 "key +ctrl z -ctrl"			# undo
xsetwacom --set "$devname_pad" Button 10 "key +ctrl +shift z -shift -ctrl"	# redo
xsetwacom --set "$devname_pad" Button 11 "key +ctrl e -ctrl"			# export
xsetwacom --set "$devname_pad" Button 12 "key +ctrl +shift e -shift -ctrl"	# export as

# PEN BUTTON SETTINGS
xsetwacom --set "$devname_stylus" Button 2 "key del"

# end gaomon_keys.sh
