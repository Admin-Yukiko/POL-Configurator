# The POL Configurator (TPC)

A graphical interface configuration tool for the Penultimate OnLine (POL) emulator (https://www.polserver.com).

POL has several confguration (cfg) files containing settings that affect the operation of the emulator. These are plain text files. Within 5 of these files, pol.cfg, servspecopt.cfg, combat.cfg, ecompile.cfg, and watch.cfg, there are 161 unique settings with only 1 value per setting.. Two additional files, servers.cfg and uoclient.cfg are more involved in their settings. In the early days of POL the developer of a server needed to pour through these files and edit the them to their liking. Now with the POL Configurator it's a little easier because everything is presented in a GUI.

This is a project I started around 2008. While working on the program I began having a problem with the it throwing an exception. I had no idea, back then, how to handle exceptions to find the bug in the code. So I put the project on the "back burner" and moved on to something else. With the passage of time I completely forgot about the program, and I mean completely! In 2017 I was going down the rabbit hole of deleting stuff from an old hard drive when I rediscovered it and decided to resurrect what was then called POL CFG edit. I looked at the code then and I was amazed that I actually wrote the original program. I am not that proficient of a programmer. For all but for a few bugs, it did what it was supposed to do.

It originally was just a graphical user interface (GUI) to configure pol.cfg. When I brought it back into development I decided to give it the ability to load and edit more than just pol.cfg. So I added servspecopt.cfg and combat.cfg to its repertoire along with a tiny file named watch.cfg. I was going to have tabs for each file but then I had an idea. I would split the settings up based on their function rather than the files they reside in. I came up with three basic functions, server settings which mostly affect the internal server operation, gameplay settings that affect the in-game play, more or less, and logging and error reporting. Since then it has grown to handle more of the POL configuration, including facet setup, script compilation, and more.

The source code is written in Pascal using the free Lazarus development platform which is available at https://www.lazarus-ide.org/

I learned Pascal before we had object oriented programming. That is why so much of TPC's internal, non-GUI, code is procedural. I hope the numerous comments throughout the code help you understand what the program is doing. I know they helped me relearn the program after 9 years of being absent from working on it. I believe you cannot have too many comments in source code. I guess that was instilled in me when I used to write assembly language.

This program is distributed under the GPL 3 license.

Yukiko 2022-09-06 00:31:02


License and Disclaimer Information:

The POL Configurator - A GUI configuration utility for the Penultima
OnLine emulator.
Copyright (C) 2022  Dan Gardner eMail: hopelives@outlook.com

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.

Please note that this program uses some third party extensions whose licenses
may NOT be compatible with the GPL 3.0 license.
Please review the synapse 4 and Legacy MULConverter 4 license for compatibility

Disclaimer
The program binary and its source code are provided free of charge. You may
copy it, distribute it, and modify it within the limitations of the GPL 3
license's provisions.

It is provided As-Is. There are NO warranties
either expressed, implied or inferred as to its functionality, usability,
usefulness or operation. The author is not responsible for any loss of data,
damage to property, hardware or software that may arise from the use of
the POL Configurator.