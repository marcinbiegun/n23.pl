---
layout: post
title: Sendy deployment on AWS
---

T2 micro is free for 6 months?

# Preqrequisites

1. SSL Cert

Prepare your SSL cert files or generate them by running `openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout sendy.key -out sendy.pem`.

Note that for production instance you need to have a paid signed SSL cert - or links and metrics won't work in the emails.

3. Server

Create new t2.micro instance (free for 6 months) with Ubuntu Server 16.04.

2. Domain

Set DNS A record pointing to your server.

## Install docker

Use sudo to install stuff and setup docker acess to tour normal user.

1. Sign in to your Ubuntu server.

2. Fix annoying locales messages

Put those two lines in `/etc/environment' file (use sudo):

```
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
```

Run command:

```
sudo locale-gen en_US.UTF-8
```

3. Install docker and docker-compose.

Folow this guide to install Docker and grant access to your user (step 1 and 2): https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

Follow this guide to install Docker-Compose (step 1): https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

## Install Sendy Docker container

Don't use sude here, everything should run from a normal user if you
granted the user access to Docker in previous step.

1. Run `git clone https://github.com/marcinbiegun/docker-sendy.git` in home directory.

2. Open `~/docker-sendy/docker/docker-compose.yml`and set mysql passwords at the bottom of the fielkk.

3. In `vim ~/docker-sendy/docker/server.conf` change value `server_name` to your domain.

4. Copy Sendy files to `~/docker-sendy/public_html`.

5. Edit `docker-sendy/public_html/include/config.php`:

* set `APP_PATH` to tour site url
* set `$dbHost` do `mysql`
* set `$dbUser` to `sendy`
* set `$dbName` to `sendy`
* set `$dbPass` to your password

6. Run `chmod 777 ~/docker-sendy/public_html/uploads`.

7. Build and start application by runnig `cd ~/docker-sendy/docker` and `docker-compose build`. Then start the app with `docker-compose start`.

8. Setup cron. Check the php container name by runnig `docker-compose ps`, it should be named like `docker_php_1`.

Then run `crontab -e` and add this line to the crontab:

```
*/5 * * * * docker exec docker_php_1 php /code/public_html/scheduled.php
```

## Prepare the app

At this point Sendy should be running. Now open the URL, finish the
setup (connect Amazon SAS account), and try to send your first
newsletter.

