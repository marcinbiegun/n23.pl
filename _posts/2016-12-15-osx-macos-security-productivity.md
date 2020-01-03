---
layout: post
title: MacOS settings for security and productivity (updated 2020)
github_issue_id: 2
---

![MacOS settings for security and productivity](/assets/osx_mac_security_productivity.png)

I was pretty impressed that my previous OSX install had served me for
4 years of heavy software development and daily personal use.

But a time has come for a fresh system reinstall.
During the setup, I had some troubles
remembering all useful system settings and tweaks I've made, so here's
the list for my future reference, and possible use for other power users.

### Apps

### Utility Apps

- [Karabinier](https://github.com/tekezo/Karabiner-Elements) - a tool for remapping keys
  - Replace CapsLock with ESC
  - Switch `right command` with `right alt` (for easier access to polish diacritic chars)
- [Alfred](https://www.alfredapp.com) (free or \$25) - application launcher and a swiss army knife
  - Bind `CMD + F1`, `CMD + F2`, etc. to app activate, my most used apps are Chrome, MacVim, and iTerm
  - Add a task to task manager's inbox, e.g. `inbox Buy milk`
  - Some custom scripts, e.g. `j GR-123"`command to open Jira ticket
- [Spectacle](https://www.spectacleapp.com/) - simple window manager, organize windows using keyboard
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12) - puts a coffee cup icon on the menu bar, clicking it prevents your Mac from going to sleep for an hour (modern version of Caffeine app)
- [Flux](https://justgetflux.com) - prevents your eyes from being burned in late hours
- [MenuMeters](http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/)
  - displays system metrics (CPU, memory, network, disk usage) on menu bar
  - quickly identify anomalies like zombie apps taking 100% of CPU power
- [BrightnessMenulet](https://github.com/superduper/BrightnessMenulet) - software controls for monitor brightness
- [BetterTouchtool](https://www.boastr.net) - customize TouchBar icons

### Security Apps

- [1Password](https://1password.com/) ($65 or $3/month) - fully featured and good looking
  password manager
- [ClamXav](https://www.clamxav.com/) (\$30) - open-source antivirus, useful
  for scanning apps from not trusted sources
- [LittleSnitch](https://www.obdev.at/products/littlesnitch/index.html) (\$30) - firewall, it requires you to set rules for any new Internet connections
  - Detect suspicious connections
  - Block unnecessary analytics/tracking connections
- [GPG Suite](https://gpgtools.org/) - GUI tools making using GPG email and files encryption easy, integrates with Mail.app
- [Chrome](https://www.google.com/chrome) with my favorite plugins:
  - [Disconnect](https://chrome.google.com/webstore/detail/disconnect/jeoacafpbcihiomhlakheieifhpjdfeo) - disables tracking/analytics/ad-network scripts
  - [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm) - best ad-blocking tool
  - [Bookolio](https://chrome.google.com/webstore/detail/bookolio/lbgmbgopjppdjfopndcniomnhpodajba) - displays a nice list of bookmarks in empty tabs, I like it better than having the bookmarks bar always visible

### Console tools

- [iTerm2](https://iterm2.com/) - a better terminal
- Install ZSH with ohmyzsh configuration https://github.com/ohmyzsh/ohmyzsh
- Install ZSH plugins: https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
- Install Popular command replacements: https://remysharp.com/2018/08/23/cli-improved
  - `alias ls="lsd"`
  - `alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"`
  - `alias cat="bat"`
  - `alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"`
  - `alias ping="prettyping --nolegend"`

## Preferences

### System Preferences

- Security & Privacy
  - FileVault - enable full-disk encryption
    - Fix a security loophole by using hibernation instead of sleep: [https://www.linkedin.com/pulse/maximizing-filevault-security-mac-os-x-matt-washchuk](https://www.linkedin.com/pulse/maximizing-filevault-security-mac-os-x-matt-washchuk)
- Date & Time
  - Display the time with seconds
  - Use a 24-hour clock
  - Show day of the week
  - Show date
- Keyboard
  - Keyboard
    - Key Repeat - Fast
    - Delay Until Repeat - Short
    - Use all `F1`, `F2`, etc. keys as standard function keys
      - You will need to hold `Fn` to use brightness/volume controls, but you can bind anything to function keys
  - Text
    - Disable all the auto-correct crap
    - Disable accents menu on key hold, run: `defaults write -g ApplePressAndHoldEnabled -bool false`
- Dock
  - Automatically hide and show the Dock - I use keys most of the time to change apps
- General
  - Use dark menu bar and Dock
- Mouse
  - Enable right click
- Accessibility
  - Enable zoom on ctrl+mousewhell
- Display
  - Disable "automatically adjust brightness"
- Mission Control
  - Prevent automatic desktops rearrangement preferences

### Finder Preferences

- Remove unused things from the sidebar
- Advanced
  - Show all file extensions

### TextEdit Preferences

- Preferences
  - Plain Text - make it like good old notepad
    - copy & paste to get rid of text formatting

## Digging deeper

Here are a few tutorials for tweaking hidden system settings.
Go through them and enable those you find suitable.

### OSX for hackers settings

A great set of ~100 settings for power users:

- El Capitan: [https://gist.github.com/brandonb927/3195465](https://gist.github.com/brandonb927/3195465)
- Sierra: [https://github.com/mathiasbynens/dotfiles/blob/master/.macos](https://github.com/mathiasbynens/dotfiles/blob/master/.macos)

### Security guides

Complete guide on how to make MacOS more secure:

- [https://github.com/drduh/macOS-Security-and-Privacy-Guide](https://github.com/drduh/macOS-Security-and-Privacy-Guide)

General Internet security guide:

- [https://www.privacytools.io/](https://www.privacytools.io/)

Simple things accesible from system preferences:

- [http://docs.hardentheworld.org/OS/OSX_10.11_El_Capitan](http://docs.hardentheworld.org/OS/OSX_10.11_El_Capitan)

- Disable macOS services calling to Cupertino:

- [https://github.com/karek314/macOS-home-call-drop](https://github.com/karek314/macOS-home-call-drop)

### Block malicious domains

The list contains a huge collection of tracking / malicious / ad-network
internet addresses. Put them inside your `/etc/hosts` system file to block
them on DNS level.

- [http://someonewhocares.org/hosts](http://someonewhocares.org/hosts)

### Other references

- https://github.com/nikitavoloboev/my-mac-os/
