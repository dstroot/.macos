## Manage your Mac like a Boss

Much of this respository comes from [Mathias Bynens'](https://github.com/mathiasbynens/) amazing [dotfiles](https://github.com/mathiasbynens/dotfiles). Mathias' MacOS defaults script is legendary. However it is buried within Mathias' own dotfiles repo.  I and others have asked that it be split out into a separate repository.  Mathias prefers it 'as is' (see [here](https://github.com/mathiasbynens/dotfiles/issues/477) and [here(https://github.com/mathiasbynens/dotfiles/issues/300)]).  Mathias' argument is "I’ve gotten used to the current workflow, and would rather not have to update two separate repositories on multiple Macs. It’s hard enough to keep just one in sync across all machines." but just because he likes it that way it does not mean it "should" be combined.

I believe dotfiles management should be logically separated from your MacOS configuration management for the obvious separation of concerns argument.

* Dotfiles, so called because the filename begins with a `.` are found in a user's home directory. These files are normally hidden from view and are created/modified as you install and configure your machine.  These are different and logically separate from the `defaults write com.apple...` settings managed by MacOS.  
* MacOS settings are are not stored any ".dotfile" but rather placed in /Users/username/Library/Preferences or /Users/username/Library/Application Support.  Both of these folders have corresponding global locations outside /Users, namely under /Library. The format of the preferences for MacOS applications are usually .plist (property-list) files with a name given in reverse-domain name syntax.
* .dotfilesare more portable across MacOS and Linux/Unix and obviously MacOS settings are specific to MacOS.
* This allows one to use a purpose-built dotfiles management solution such as Mackup discussed below.

The idea behind this repo is to create a separate repository to manage MacOS defaults and make it slightly more configurable and maybe focus the work the community is doing on the programmatic configuration of MacOS.  For example I personally only use about half the settings in the original script and there are some indications that some of settings may even be detrimental[1].

_[1] The original script settings turn off your laptop's power saving features (sleep, display dimming, hibernation), remove at least three kinds of backups for data loss (MobileTimeMachine, Resume, and your hibernation file), and changes AppKit settings in a way your customers will likely not be using (by turning off Automatic Termination). From a security view the script forcefully disables GateKeeper as well, with the intention of allowing you to install apps not published in the Mac App Store._

## Managing your MacOS configuration

1. Fork this repository to manage your own configuration.
2. Clone it to your home directory and run `osx_defaults.sh` like so:

```sh
cd ~
git clone https://github.com/dstroot/.macos.git
cd .macos
chmod +x *.sh
./macos_defaults.sh
```

MacOS configuration data is stored in separate sub-topics in the `defaults` folder.  You can add/subtract topics as you see fit and you can modify them as needed to suit your purposes.

That's it! Simple right?

## Dotfiles Management

Dotfiles, so called because the filename begins with a `.` are found in a user's home directory. These files are normally hidden from view and are created/modified as you install and configure your machine.  These are different and logically separate from the `defaults write com.apple...` settings managed by .osx.  

Initially people created a directory called `.dotfiles`, moved their dotfiles there, and symlinked them back to their original locations. Then they turned this into a git repository so they can save and version changes, back them up to GitHub, and use them across machines. Pretty cool right?

However there are some downsides to this approach:

* Your configuration is only backed up when you do a commit and a push.  If you don't do this often your most recent changes are not saved.
* Since these are "your" configuration files they may have sensitive information in them like passwords and such.  You can pay for private repositories on GitHub, or go through hoops to make sure your confidential data is not committed.  However if it's not committed in a repository where is it?  Is it backed up?
* By focusing on dotfiles there are a number of other things that don't get backed up. You can address them in a similar way - moving the files into your dotfiles folder and symlinking them back but **you** have to be aware of them first.  For example which Atom or Sublime Text packages do you have installed?

##### I recommend [Mackup](https://github.com/lra/mackup):

Mackup takes your dotfiles and backs them up to Dropbox, iCloud, Google Drive, etc. and then symlinks them back as discussed above. But it's also much more than that - it understands where applications store configuration data and how to save it, beyond just dotfiles.

Advantages:
* Dropbox. iCloud, etc. is private by default (if you trust it's security) so you don't have to worry about your private information being committed to a public github repository.
* Dropbox/iCloud/Google Drive syncs automatically so your dotfiles are **automatically and continously** backed up from that point forward.
* Mackup understands applications and where they stash configuration data and **also** backs that up for you.  

Resources:
https://gist.github.com/brandonb927/3195465
https://github.com/mathiasbynens/dotfiles/blob/master/.osx
