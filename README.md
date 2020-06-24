# .kito

This is my dotfiles, I use it to:
* bootstrap new working environments
* keep my configuration files organized
* keep copies of plugins and open source chrome extensions I on my browsers.

I use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about), and using [Microsoft Terminal](https://github.com/microsoft/terminal), but configurations may work on.

Most of these scripts are me configuring my desktop environments. They are quite easy to read and modify for your own use cases. This dotfiles initially was inspired by similar projects [@mathiasbynens](https://github.com/mathiasbynens/dotfiles) and [@paulirish](https://github.com/paulirish/dotfiles), I check other people changes from time to time and change mine for my own taste.

There are lots of other configuration files shared by other talented people which you can find and use on [dotfiles](https://dotfiles.github.io/) and find your inspiration.

## Usage.
Right now I run different scripts based on environment and requirements of that environment, they are located in init directory. They create or link initial scripts for my development environment. I strongly recommend reading them if you want to use them.

## What's up with submodules?

I decided to have snapshot of current stable version. Reason for this was the these scripts rely on these specific versions of those packages to work, and some of those packages are not updated in older operating systems. The will prevent accidental breaking of entire environment because one package was updated. I update them from time to time.

## Why extensions?

There are lots of usefull open source extensions out there not available on chrome store. Also it's a hassle to move these extensions around.

On the hand I want to check for potential issues of the extension. I'm allowing these extensions to have my history. Instead of autoupdating everything from everyone as a security measure for myself. There are some extensions that rely on configurations, which google sync works best for them and are trusted heavily by the industry. It's a way to sync those extensions. Not that much automated yet.

## Why shortcuts?

I use [autohotkey](https://www.autohotkey.com/) to remap some of my keys in a way that's more natural and general. Decided to store those configurations in the same repository. Sometimes it's dependent on the hardwares I'm using. But most of them are not. So it will be a pain in the neck to recreate for each system. I use a slgihtly modified version of [Windows 10 Virtual Desktop Enhancer](https://github.com/sdias/win-10-virtual-desktop-enhancer/) for basis of my configuration files (which was a great project, it was sad to hear no longer maintained).

## TODOS

* Update scripts.
* Move extension configurations to this
* Move editor configurations to this
* Add scripts for desktop environmets (that I use)
* Add link to reasons why I changed from MacOS to WSL
* Create a fork of Windows 10 Virtual Desktop Enhancer instead

