# Ansible role `systemd_unit_failure`

Sets up a systemd unit that can be used for `OnFailure` actions. The unit
executes a script that creates a Windows notification. The script comes with a
built-in rate limit scoped to the unit name to prevent spam.

It can be used like this:

```
OnFailure={{ systemd_unit_failure_unit_name | replace('@', '@%n') }}
```
