# Ansible role `systemd_failure`

Sets up a systemd unit that can be used for `OnFailure` actions. The unit
executes a script that creates a Windows notification. The script comes with a
built-in rate limit scoped to the unit name to prevent spam.
