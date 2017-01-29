#!/usr/bin/python
#
# 01/29/2016 v.0.1 Investigation In Progress or WIP
#
# This script isn't useful yet, it currently only good as a keyboard scancode reference


# Following two {} and ()'s borrowed from https://www.virtualbox.org/svn/vbox/trunk/src/VBox/Frontends/VBoxShell/vboxshell.py

# PC XT scancodes
scancodes = {
    'a':  0x1e,
    'b':  0x30,
    'c':  0x2e,
    'd':  0x20,
    'e':  0x12,
    'f':  0x21,
    'g':  0x22,
    'h':  0x23,
    'i':  0x17,
    'j':  0x24,
    'k':  0x25,
    'l':  0x26,
    'm':  0x32,
    'n':  0x31,
    'o':  0x18,
    'p':  0x19,
    'q':  0x10,
    'r':  0x13,
    's':  0x1f,
    't':  0x14,
    'u':  0x16,
    'v':  0x2f,
    'w':  0x11,
    'x':  0x2d,
    'y':  0x15,
    'z':  0x2c,
    '0':  0x0b,
    '1':  0x02,
    '2':  0x03,
    '3':  0x04,
    '4':  0x05,
    '5':  0x06,
    '6':  0x07,
    '7':  0x08,
    '8':  0x09,
    '9':  0x0a,
    ' ':  0x39,
    '-':  0xc,
    '=':  0xd,
    '[':  0x1a,
    ']':  0x1b,
    ';':  0x27,
    '\'': 0x28,
    ',':  0x33,
    '.':  0x34,
    '/':  0x35,
    '\t': 0xf,
    '\n': 0x1c,
    '`':  0x29
}

extScancodes = {
    'ESC' :    [0x01],
    'BKSP':    [0xe],
    'SPACE':   [0x39],
    'TAB':     [0x0f],
    'CAPS':    [0x3a],
    'ENTER':   [0x1c],
    'LSHIFT':  [0x2a],
    'RSHIFT':  [0x36],
    'INS':     [0xe0, 0x52],
    'DEL':     [0xe0, 0x53],
    'END':     [0xe0, 0x4f],
    'HOME':    [0xe0, 0x47],
    'PGUP':    [0xe0, 0x49],
    'PGDOWN':  [0xe0, 0x51],
    'LGUI':    [0xe0, 0x5b], # GUI, aka Win, aka Apple key
    'RGUI':    [0xe0, 0x5c],
    'LCTR':    [0x1d],
    'RCTR':    [0xe0, 0x1d],
    'LALT':    [0x38],
    'RALT':    [0xe0, 0x38],
    'APPS':    [0xe0, 0x5d],
    'F1':      [0x3b],
    'F2':      [0x3c],
    'F3':      [0x3d],
    'F4':      [0x3e],
    'F5':      [0x3f],
    'F6':      [0x40],
    'F7':      [0x41],
    'F8':      [0x42],
    'F9':      [0x43],
    'F10':     [0x44 ],
    'F11':     [0x57],
    'F12':     [0x58],
    'UP':      [0xe0, 0x48],
    'LEFT':    [0xe0, 0x4b],
    'DOWN':    [0xe0, 0x50],
    'RIGHT':   [0xe0, 0x4d],
}

def keyDown(ch):
    code = scancodes.get(ch, 0x0)
    if code != 0:
        return [code]
    extCode = extScancodes.get(ch, [])
    if len(extCode) == 0:
        print("bad ext", ch)
    return extCode

def keyUp(ch):
    codes = keyDown(ch)[:] # make a copy
    if len(codes) > 0:
        codes[len(codes)-1] += 0x80
    return codes

#/end borrow

# this shows us that we need to add 0x80 to the scancode hex (excluding 0xe0) to get 
#  our release scancode value. Then hex() it.

#Print the release scancodes I was looking for:
#F2
releaseOffset=0x80
print hex(extScancodes['F2'] + releaseOffset)

#Left Alt
print hex(extScancodes['LALT'] + releaseOffset)

#Left Ctrl
print hex(extScancodes['LCTR'] + releaseOffset)

##
## Example of a Ctrl+Alt+F2 key combo sent to a VM:
#VBoxManage controlvm b0456a42-64b2-474f-b601-5eace7d8f925 keyboardputscancode 3c 38 1d # press..
#VBoxManage controlvm b0456a42-64b2-474f-b601-5eace7d8f925 keyboardputscancode bc b8 9d # ..and release
##

# Now figure out why above hex reference doesn't match http://lxr.free-electrons.com/source/drivers/input/keyboard/hpps2atkbd.h

Print "This is just reference code."
