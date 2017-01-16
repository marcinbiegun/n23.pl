---
layout: post
title: Sendy deployment with Docker
---

![Sendy deployment with Docker](/assets/sendy_docker.png)

If you look for a simple, inexpensive and solid newsletter service, I
can recommend [Sendy](https://sendy.co) - it's a self-hosted (PHP and MySQL) system using Amazon SES to deliver emails.

It costs $59 for a license + a few dollars monthly for SES deliveries, in my case it's 20x cheaper
that MailChimp or GetResponse.

I didn't find any clear end-to-end instructions how to install Sendy,
so I've prepared my own [Docker-Sendy](https://github.com/marcinbiegun/docker-sendy)
configuration which will get you a running Sendy instance in few easy steps.

## Prerequisites

1. Sendy files and license number

2. Server - create a t2.micro instance on AWS ([free](https://aws.amazon.com/free) for 12 months since signup)
or prepare other small machine (512MB of RAM is enough) with Ubuntu Server 16.04

3. Domain address - set a DNS record pointing to your server's IP address

4. SSL - prepare certificate files for your domain

## Install Docker and Docker-Compose

1. Install Docker and grant non-sudo Docker access for your user (steps 1 & 2):
    * [How To Install and Use Docker on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

2. Install Docker-Compose (step 1):
    * [How To Install Docker Compose on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)

## Install Sendy as a Docker container

1. Clone my Docker-Compose configuration in home directory: `git clone https://github.com/marcinbiegun/docker-sendy.git`

2. Upload your SSL ceriticate files as `~/docker-sendy/docker/sendy.key` and `~/docker-sendy/docker/sendy.pem`

3. Open `~/docker-sendy/docker/docker-compose.yml` and set MySQL passwords at the end of the file

4. In `~/docker-sendy/docker/server.conf` change value of `server_name` to your domain name

5. Copy Sendy files inside `~/docker-sendy/public_html`

6. Edit `~/docker-sendy/public_html/include/config.php`:
    * set `APP_PATH` to your site URL
    * set `$dbHost` do `mysql`
    * set `$dbUser` to `sendy`
    * set `$dbName` to `sendy`
    * set `$dbPass` to the password you've set in `docker-compose.yml`

6. Run `chmod 777 ~/docker-sendy/public_html/uploads`

7. Inside `~/docker-sendy/docker` directory, run `docker-compose build` to build the containers, then start the app with `docker-compose start`

8. Setup cron. Find the PHP container's name by running `docker-compose ps`, it will be named like `docker_php_1`.  Run `crontab -e` and add this line:

```
* * * * * docker exec docker_php_1 php /code/public_html/scheduled.php
```

## Configure Sendy

At this point Sendy should be up and running under your domain address. Open it, finish the
setup inside Sendy installer (connect Amazon SAS account, etc.).

Done! You can send your first newsletter.
