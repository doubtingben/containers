# tarsnap container

`/etc/tarsnap.conf` is the conf

`/tarsnap/key` is the key file location

`/tarsnap/cache` is the cache location

`/tarsnap` is exported for key mapping and caching

`/volume` is exported for backup directory mapping


## Something like:


### Create backup
```
export TARSNAP_CONF_DIR=/srv/tarsnap
export TARSNAP_BACKUP_DIR=/home/bnwilson/shots
export TARSNAP_RESTORE_DIR=/home/bnwilson/tarsnap-restore
export TARSNAP_BACKUP_NAME=backup-$(date +%Y%m%d)
export TARSNAP_BACKUP_NAME=$(echo ${TARSNAP_BACKUP_DIR} | sed 's|/|_|g')-$(date +%Y%m%d)
export TARSNAP_RESTORE_NAME=

docker run --rm -ti -v ${TARSNAP_CONF_DIR}:/tarsnap \
    -v ${TARSNAP_BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -v -f ${TARSNAP_BACKUP_NAME} -c /volume/
```

### fsck needed sometimes
```
docker run --rm -ti -v ${TARSNAP_CONF_DIR}:/tarsnap \
    -v ${TARSNAP_BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -v --fsck
```

### List avilable backups
```
docker run --rm -ti -v ${TARSNAP_CONF_DIR}:/tarsnap \
    doubtingben/tarsnap tarsnap -v --list-archives
```

### Restore/eXtract
```
docker run --rm -ti -v ${TARSNAP_CONF_DIR}:/tarsnap \
    -v ${TARSNAP_BACKUP_DIR}/${TARSNAP_BACKUP_NAME}:/volume \
    doubtingben/tarsnap tarsnap -x -f ${TARSNAP_BACKUP_NAME} 

```

