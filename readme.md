Check ZFS Pools for Errors
==========================

This is an extremely simple script that will return the output of `zpool
status` if the word `DEGRADED` is seen when running the `zpool status` command.

Suggested use is to set this up to run every few hours via `cron`, which (when
properly configured) will email the root user anything printed to stdout.


Testing
-------

You can easily test that this is working by intentionally putting your
array in a degraded state. For example, `zpool offline DEVICE_NAME`
should put the pool into a degraded state and `zpool online DEVICE_NAME`
will restore it to good health.

Officially, I wouldn't recommend doing this on a pool containing
critical data, but you should be able to take a drive offline, see that
the script reports an error, and online the drive without major risk
(unless you happen to be extremely unlucky and have another drive fail
during the very brief window while you're testing this out...)
