Android Command-Line SSH

This project is an installer for a non-rooted Android shell command line version of the SSH tools.

Requirements:

    + ARM-based Android device.
    + Android 1.6 or newer.
    + You must have a terminal emulator such as Android Terminal Emulator installed on your device.
    + You must have "adb" installed on your computer.
    + You must have "bash" installed on your computer. (Sorry if you've got a Windows machine.)

Features:

    + Installs command-line versions of ssh, scp, and related command-line tools.
    + Works on ordinary non-Rooted Android devices.

Install instructions:

    $ tools/install.sh

Use instructions:

    + Launch Android Terminal Emulator
    + Put /data/local/bin on your PATH
    + Put /data/local/lib on your LD_LIBRARY_PATH

Known Bugs:

    + Looks for configuration files in /data/.ssh (which is not writable by non-rooted phones.)
