# The POL Configurator (TPC)

A graphical interface configuration tool for the Penultimate OnLine (POL) emulator (www.polserver.com).

POL has several confguration (cfg) files containing settings that affect the operation of the emulator. These are plain text files. Within 5 of these files, pol.cfg, servspecopt.cfg, combat.cfg, ecompile.cfg, and watch.cfg, there are 161 unique settings with only 1 value per setting.. Two additional files, servers.cfg and uoclient.cfg are more involved in their settings. In the early days of POL the developer of a server needed to pour through these files and edit the settings to their liking. Now with the POL Configurator it's easier because everything is presented in a GUI.

This is a project I started around 2008. I was having a problem with the program throwing an exception. I had no idea, back then, how to handle exceptions. So I put the project on the "back burner". With the passage of time I completely forgat about the program. And I mean completely! In 2017 I was going down the rabbit hole of deleting old stuff from an old hard drive and I rediscovered it and decided to resurrect what was then called POL CFG edit. I look at the code and I am amazed that I actually wrote the original program and, all but for a few bugs, it did what it was supposed to do.

It originally was just a graphical user interface (GUI) to configure pol.cfg. When I brought it back into development I decided to give it the ability to load and edit more than just pol.cfg. So I added servspecopt.cfg and combat.cfg to its repertoire along with a tiny file named watch.cfg. I was going to have tabs for each file but then I had an idea. I would split the settings up based on their function rather than the files they reside in. I came up with three basic functions, server settings which mostly are hidden from the player, gameplay settings which in some way are most visible to the player, and logging and error reporting. Since then it has grown to handle more of the POL configuration, including facet setup, script compilation, and more.

The source code is written in Pascal using the free Lazarus development platform which is available at https://www.lazarus-ide.org/

I learned Pascal before we had object oriented programming. That is why so much of TPC's internal, non-GUI, code is procedural. I hope the numerous comments throughout the code help you understand what the program is doing. I know they helped me relearn the program after 9 years of being absent from working on it. I believe you cannot have too many comments in source code. I guess that was instilled in me when I sed to write assembly language.

This program is distributed under the GPL 3 license.

Yukiko
2022-09-06 00:31:02