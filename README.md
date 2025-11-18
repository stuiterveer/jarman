# JarMan

Import and run J2ME MIDlets

## Building

1. Clone this repository including all submodules with `git clone --recurse-submodules https://github.com/stuiterveer/jarman.git`.
2. Put the .jar file you want in the root of this directory and name it `midlet.jar`.
3. Compile freej2me first with `clickable build --libs`.
4. Compile JarMan with `clickable build`.

## Known issues

- Currently only works for x64, compiling for aarch64 is being worked on.
- Requires a keyboard to be connected, as freej2me will use keyboard bindings. Currently no OSK is provided.
- No sound.

## License

Copyright (C) 2025  stuiterveer

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License version 3, as published by the
Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranties of MERCHANTABILITY, SATISFACTORY
QUALITY, or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.
