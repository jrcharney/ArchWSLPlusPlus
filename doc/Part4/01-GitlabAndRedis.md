Part 4: More > Gitlab and Redis
---

> NOTE: This document is under construction. There's some things that need to be sorted out.

# Gitlab and Redis

My code boot camp is using Gitlab. Turns out there is a `gitlab` package in the ArchLinux software repository.
This package will install a few things including [Redis](https://redis.io/) and for some reason Ruby version 2.7? (Remember when I said 'lolcat' installs Ruby? I don't know why they are calling an older version of it.)

The the `gitlab` package installs the following items at the time of this writing (October 7, 2022):

- `gitlab-gitaly-15.4.0-1`
- `gitlab-shell-3:14.11.0-1`
- `gitlab-workhorse-8.65.0-1`
- `jemalloc-1:5.3.0-1`
- `libxslt-1.1.37-2`
- `perl-image-exiftool-12.42-1`
- `re2-1:20220601-1`
- `redis-7.0.5-1` (It should be noted that I will be installing MySQL and MongoDB later for this boot camp. I'll write about it in a separate post.)
- `ruby2.7-2.7.6-1`  (Not sure why we install this. Current Ruby version is 3.0)
- `gitlab-15.4.1-1`


But we just need to run this next line.
```bash
sudo pacman -S gitlab
```

Notice when we install this, we will get some notification when we install the `gitlab-shell` and `gitlab` packages.

```
Configure gitlab-shell in /etc/webapps/gitlab-shell/config.yml
Put a secret bytestring to /etc/webapps/gitlab-shell/secret
...
warning: directory permissions differ on /var/log/gitlab/
filesystem: 770  package: 755
Configure your /etc/webapps/gitlab/gitlab.yml
Set up your redis to run on /run/redis/redis.sock or configure gitlab to use redis TCP
Put a secret bytestring to /etc/webapps/gitlab/secret
Copy /usr/share/webapps/gitlab/config/secrets.yml.example to /etc/webapps/gitlab/secrets.yml and configure it
Setup the database:
$ (cd /usr/share/webapps/gitlab && sudo -u gitlab $(cat environment | xargs) bundle-2.7 exec rake gitlab:setup)
Finally run the following commands to check your installation:
$ (cd /usr/share/webapps/gitlab && sudo -u gitlab $(cat environment | xargs) bundle-2.7 exec rake gitlab:env:info)
$ (cd /usr/share/webapps/gitlab && sudo -u gitlab $(cat environment | xargs) bundle-2.7 exec rake gitlab:check)
...
(1/5) Creating system user accounts...
Creating group 'gitlab' with GID 105.
Creating user 'gitlab' (n/a) with UID 105 and GID 105.
Creating group 'redis' with GID 972.
Creating user 'redis' (Redis in-memory data structure store) with UID 972 and GID 972.
(2/5) Reloading system manager configuration...
  Skipped: Current root is not booted.
(3/5) Creating temporary files...
/usr/lib/tmpfiles.d/journal-nocow.conf:26: Failed to resolve specifier: uninitialized /etc detected, skipping
All rules containing unresolvable specifiers will be skipped.
(4/5) Arming ConditionNeedsUpdate...
(5/5) Warn about old perl modules
```

This is some stuff I need to figure out, but do note that `gitlab` and `redis` created their ouwn user and group.

## A Note about Relational Database Systems
Because [MySQL](https://www.mysql.com/) and [MongoDB](https://www.mongodb.com/) are licensed differently, these softwares are in the AUR.  [Redis](https://redis.io/) and [PostgreSQL](https://www.postgresql.org/) are in the regular ArchLinux repo, but in terms of Relation Database Management Systems (RDBMSs), Arch prefers MariaDB which is a fork of MySQL.  Personally, I like PostgreSQL because [Node-Postgres](https://node-postgres.com/) works well with NodeJS.  I'll probably write a different post about it in the future.

---
[Up: Index](../00-START_HERE.md)

