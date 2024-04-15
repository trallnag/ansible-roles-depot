# Ansible Role `systemd_environmentd`

Set ups systemd for the management of environment variables independent of any
shell. Or at least that is the target scenario. Currently the environment
variables are not visible in login sessions.

As a workaround, the output from the generator can be sourced by shells at login
time. Here is a POSIX-compliant snippet:

```shell
set -a
. /dev/fd/0 <<EOF
$(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
EOF
set +a
```

## References

- <https://github.com/systemd/systemd/issues/7641>
