# Restore database from dump

The dump file name is "tip.bac".

First create a new database called "tip-dev".

```
sudo -u postgres createdb tip-dev

```

Second, restore database from dump file.

```
\pg_restore -d tip-dev backups/tip.bac
```


This way, the owner of the table is gaut. ($USER)