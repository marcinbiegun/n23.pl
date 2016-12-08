---
layout: post
title: Sendy deployment on AWS
---

T2 micro is free for 6 months?

Preqrequisites:

* SSL cert (buy or generate it)
* domain/subdomain

1. Create new t2.micro instance with Ubuntu Server 16.04.

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

Folow this guide to install Docker (step 1 and 2): https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

Follow this guide to install Docker-Compose (step 1): https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

4. Clone https://github.com/mortezaPRK/docker-php_fpm-nginx.git and rename to `sendy`.

5. In `~/sendy/.docker/docker-compose.yml` remove `psql` and set mysql passwors.

6. In `nginx.conf`:

* set domain name
* add ssl config
* put rewrite

7. add sql_mode to mysql.cnf file

8. copy sendy files into public_html

9. edit includes/config.php (mysql hostname should be `mysql`)

10. chmod 777 `public_html/uploads`

11. setup cron locally (not inside docker, it's hard)

```
*/5 * * * * docker exec docker_php_1 php /code/public_html/scheduled.php
```

12. enable gettext (added to some file)


13.  generate not-signed ssll keys

```
openssl req -x509 -newkey rsa:4086 \
-keyout key.pem -out cert.pem \
-days 3650 -nodes -sha256
```
