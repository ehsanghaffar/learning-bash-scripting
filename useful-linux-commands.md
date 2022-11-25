```bash
FTP_PASSWORD=XjzzoNbjIr82vI duplicity /home ftp://b111794@b111794.parspack.org/Ehsan/backup
```

show all folder size in the current directory

```bash
du -h --max-depth=1
```

#### User commands

List of all users

```bash
# with details
cat /etc/passwd

# just user name
awk -F':' '{ print $1}' /etc/passwd
# Or
cut -d: -f1 /etc/passwd

```

Get a list of all users using the getent command

```bash
getent passwd
getent passwd | grep tom
## get a list all users ##
getent passwd | cut -d: -f1
## count all user accounts using the wc ##
getent passwd | wc -l
```

Script for get lists both system and users accounts, [here](/part01/users_list.sh)
