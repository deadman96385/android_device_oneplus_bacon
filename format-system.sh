#!/sbin/sh

# find out the fs_type of /system so it is formatted correctly
mount | grep -q 'system type f2fs'
SYSTEM_F2FS=$?

if [ $SYSTEM_F2FS -eq 0 ]; then
  mkfs.f2fs /dev/block/platform/msm_sdcc.1/by-name/system
elif [ $SYSTEM_F2FS != 0 ]; then
   mkfs.ext4 /dev/block/platform/msm_sdcc.1/by-name/system
fi

# find out the fs_type of /cache so it is formatted correctly
mount | grep -q 'cache type f2fs'
CACHE_F2FS=$?

if [ $CACHE_F2FS -eq 0 ]; then
  mkfs.f2fs /dev/block/platform/msm_sdcc.1/by-name/cache
elif [ $CACHE_F2FS != 0 ]; then
   mkfs.ext4 /dev/block/platform/msm_sdcc.1/by-name/cache
fi