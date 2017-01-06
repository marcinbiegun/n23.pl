---
layout: post
title: OSX / MacOS settings for security and productivity
---

![OSX / MacOS settings for security and productivity](/assets/osx_mac_security_productivity.png)

I was pretty impressed that my previous OSX install had served me for
4 year of heavy software development and daily personal use.

This year I've decided to do a fresh Sierra install.
During the setup, I had some troubles
remembering all useful system settings and tweaks I've made, so here's
the list for my future reference, and possible use for other power users.

### Apps

### Utility Apps

* [Karabinier](https://github.com/tekezo/Karabiner-Elements) - best tool for remapping keys
  * Disable CapsLock
  * Switch `right command` with `right alt` for easier access to polish diacritic chars
* [Alfred](https://www.alfredapp.com) (free or $25) - application launcher and a swiss army knife
  * Bind `CMD + F1`, `CMD + F2`, etc. to app activate, my most used apps are Chrome, MacVim and iTerm
  * Some custom scripts, e.g. "j GR-123" command to open Jira ticket
* [Spectacle](https://www.spectacleapp.com/) - simple window manager, organize windows using keyboard
  * `Option + Command + F` to maximize active window
  * `Option + Command + ←` to move window to the left part of the screen
* [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake) - puts a coffe cup icon on menu bar, clicking it prevets your Mac from going to sleep for an hour (modern version of Caffeine app)
* [Flux](https://justgetflux.com) - prevents your eyes from being burned in late hours
* [MenuMeters](http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/) - displays system metrics (CPU, memory, network, disk usage) on menu bar
  * I like seeing CPU usage to quickly see anomalies like zombie apps taking 100% of CPU power

### Security Apps

  * [1Password](https://1password.com/) ($65 or $3/month) - fully featured and good looking
  password manager
  * [ClamXav](https://www.clamxav.com/) ($30) - open-source antivirus, useful
  for scanning apps from not trusted sources
  * [LittleSnitch](https://www.obdev.at/products/littlesnitch/index.html) ($30) - firewall, it requires you to set rules for any new Internet connections
    * Block unnecessary analytics/tracking connections coming from the system or apps
    * Detect suspicious connections
  * [MicroSnitch](https://www.obdev.at/products/microsnitch/index.html) ($5) - notifies you when any app uses the camera or microphone
  * [TorBrowser](https://www.torproject.org/projects/torbrowser.html.en) - the simplest way to be sure you are using TOR correcly is to have a dedicated TOR browser
  * [GPG Suite](https://gpgtools.org/) - GUI tools making using GPG email and files encryption easy, integrates with Mail.app
  * [Coherence](http://www.bzgwebs.com/coherence) ($3) - encapsulates webapps as Mac apps
  * [Chrome](https://www.google.com/chrome) with my favorite plugins:
    * [Disconnect](https://chrome.google.com/webstore/detail/disconnect/jeoacafpbcihiomhlakheieifhpjdfeo) - disables tracking/analytics/ad-network scripts 
    * [AdBblock](https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom) - disables ads
    * [Signal](https://chrome.google.com/webstore/detail/signal-private-messenger/bikioccmkafdpakkkcpdbppfkghcmihk) - safe communication
    * [Tab Wrangler](https://chrome.google.com/webstore/detail/tab-wrangler/egnjhciaieeiiohknchakcodbpgjnchh) - automatically closes unused tabs after 20m
    * [Bookolio](https://chrome.google.com/webstore/detail/bookolio/lbgmbgopjppdjfopndcniomnhpodajba) - displays a nice list of bookmarks in empty tabs, I like it better than having the bookmarks bar always visible
    * [Pocket](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj) - stores articles to read later on iPhone during commute/lunch

## Preferences

### System Preferences

* Security & Privacy
  * FileVault - enable full-disk encryption
     * Fix a security loophole by using hibernation instead of sleep: [https://www.linkedin.com/pulse/maximizing-filevault-security-mac-os-x-matt-washchuk](https://www.linkedin.com/pulse/maximizing-filevault-security-mac-os-x-matt-washchuk)
* Date & Time
  * Display the time with seconds
  * Use a 24-hour clock
  * Show day of the week
  * Show date
* Keyboard
  * Keyboard
     * Key Repeat - Fast
     * Delay Until Repeat - Short
     * Use all `F1`, `F2`, etc. keys as standard function keys
         * You will need to hold `Fn` to use brigthness/volume controls, but you can bind anything to function keys
  * Text
     * Disable all the auto-correct crap
     * Disable accents menu on key hold, in console: `defaults write -g ApplePressAndHoldEnabled -bool false`
* Dock
  * Automaticaly hide and show the Dock - I use keys most of the time to change apps
* General
  * Use dark menu bar and Dock
* Mouse
  * Enable right click
* Accessibility
  * Enable zoom on ctrl+mousewhell
* Spotlight
  * Disable Folders only if you don't use spotlight for finding files (I use console tools)
  * Disable everything else for security & performance reasons
* Display
  * Disable "automatically adjust brightness"
* Mission Control
  * Prevent automatic desktops rearrangement preferences

### Finder Preferences

* Remove unused things from sidebar
* Advanced
  * Show all file extensions

### TextEdit Preferences

* Preferences
  * Plain Text - make it like good ol'Notepad
     * copy & paste to get rid of text formatting

## Digging deeper

Here's a few tutorials for tweaking hidden system settings.
Go throught them and enable those you find suitable.

### OSX for hackers settings

A great set of ~100 settings for power users:

* El Capitan: [https://gist.github.com/brandonb927/3195465](https://gist.github.com/brandonb927/3195465)
* Sierra: [https://github.com/mathiasbynens/dotfiles/blob/master/.macos](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)

### Security guides

Simple things accesible from system preferences:

* [http://docs.hardentheworld.org/OS/OSX\_10.11\_El\_Capitan](http://docs.hardentheworld.org/OS/OSX_10.11_El_Capitan)

A magnificent, complete guide on how to make macOS more secure:

* [https://github.com/drduh/macOS-Security-and-Privacy-Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

General Internet security guide:

* [https://www.privacytools.io/](https://www.privacytools.io/)

### Block malicious domains

The list contains a huge collection of tracking / malicious / ad-network
internet addresses.  Put them inside your `/etc/hosts` system file to block
them on DNS level.

* [http://someonewhocares.org/hosts](http://someonewhocares.org/hosts)
