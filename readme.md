Check ZFS Pools for Errors
==========================

This is an extremely simple script that will return the output of `zpool
status` if the word `DEGRADED` or `FAULTED` is seen when running the
`zpool status` command.

Suggested use is to set this up to run every few hours via `cron`, which (when
properly configured) will email the root user anything printed to stdout.


Testing
-------

You can easily test that this is working by intentionally putting your
array in a degraded state. For example:

```
$ ./check-for-degraded-zfs.sh
# Should return with no output 

$ zpool offline POOL_NAME DEVICE_NAME
# Pool is now degraded

$ ./check-for-degraded-zfs.sh
# Should warn and show zpool status

$ zpool online POOL_NAME DEVICE_NAME
# Pool should now recover automatically
```

Officially, I wouldn't recommend doing this on a pool containing
critical data, but you should be able to take a drive offline, see that
the script reports an error, and online the drive without major risk
(unless you happen to be extremely unlucky and have another drive fail
during the very brief window while you're testing this out...)
