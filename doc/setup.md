# Setup from backup file


## Create database

```
$ sudo -u postgres psql

=> CREATE DATABASE tip_dev_0;
=> ALTER DATABASE tip_dev_0 OWNER TO gaut;
```

## Restore database

```
$ pg_restore -d tip_dev_0 backups/tip.bac
```

## Enter database

```
$ psql tip_dev_0
```

