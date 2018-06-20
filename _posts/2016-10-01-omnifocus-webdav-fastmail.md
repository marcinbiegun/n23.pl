---
layout: post
title: OmniFocus sync with FastMail using WebDAV
github_issue_id: 1
---

![FastMail OmniFocus sync](/assets/fastmail_omnifocus/fastmail_omnifocus_sync.png)

If you happen to use both OmniFocus and FastMail, you can
sync your encrypted OmniFocus database using FastMail servers.
It's done via WebDAV protocol, which is available on all paid FastMail
accounts.

Here's a quick tutorial how to set it up.

## Create safe FastMail app-password

Let's start with generating app-password for accessing WebDAV.

1. Sign to your FastMail account [https://www.fastmail.com/login](https://www.fastmail.com/login).

2. Go to "Settings" -> "Password & Security".

3. Under "App Passwords" section, click the "New App Password" button.

4. Select any "Device" type, in "Access" select "Files (FTP/WebDAV)".

5. Store the password temporarily, or just left the browser tab open for now.

## Connect OmniFocus on OSX

Let's sync the database from OSX client:

1. Open "Preferences".

2. In "Synchronization" tab select "Advanced (WebDAV)".

3. Put in this address: `https://webdav.fastmail.com/{username}/files/`, where `{username}`
   is your FastMail login, with `@` char replaced with `.`, e.g. `mike.fastmail.fm`.

4. Click "Sync Now".

5. Your should be prompted for a password, use your normal FastMail login and
   the app-password previously generated.

6. If everything is fine, the app will successfully peform the first sync now.

7. Notice you didn't provide an encryption password yet - by default,
   OmniFocus uses the same password both for accessing WebDAV and as an
   key for encrypting the database.

   To set the ecnryption password, click "Show Sync Details...",
   go to "Encryption" tab and set it there.

## Connect OmniFocus on iOS

1. Open "Settings" (pull down to find it), select "Sync Method" -> "Custom (WebDAV)".

2. Enter the same WebDAV credentials as previously on OSX: address, login and app-password.

3. If eveyrtihng went fine, you'll should be prompted for your encryption password.

## Summary

That's it! I've tested the setup on my account and it works flawlessy.

## Sources

* [OmniFocus OSX sync](https://support.omnigroup.com/documentation/omnifocus/mac/2.7/en/getting-synced)
* [OmniFocus iOS sync](https://support.omnigroup.com/documentation/omnifocus/ios/2.17/en/getting-synced)
* [FastMail WevDAV](https://www.fastmail.com/help/files/davnftp.html)

