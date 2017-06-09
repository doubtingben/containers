# tarsnap container

`/etc/tarsnap.conf` is the conf

`/tarsnap/key` is the key file location

`/tarsnap/cache` is the cache location

`/tarsnap` is exported for key mapping and caching

`/volume` is exported for backup directory mapping


## Something like:


### Create backup
```
export TARSNAP_DIR=/srv/tarsnap
export BACKUP_DIR=/home/bnwilson/docker
export BACKUP_NAME=docker-$(date +%Y%m%d)

docker run --rm -ti -v ${TARSNAP_DIR}:/tarsnap \
    -v ${BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -v -f ${BACKUP_NAME} -c /volume/
```

### fsck needed sometimes
```
docker run --rm -ti -v ${TARSNAP_DIR}:/tarsnap \
    -v ${BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -v --fsck
```

### List avilable backups
```
docker run --rm -ti -v ${TARSNAP_DIR}:/tarsnap \
    -v ${BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -v --list-archives
```

### Restore/eXtract
```
docker run --rm -ti -v ${TARSNAP_DIR}:/tarsnap \
    -v ${BACKUP_DIR}:/volume \
    doubtingben/tarsnap tarsnap -x -f ${BACKUP_NAME} 


```
