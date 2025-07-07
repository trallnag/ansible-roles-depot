# Ansible role `onfailure_alert`

Sets up a systemd unit that can be used for `OnFailure` actions. The unit
executes a script that creates a Windows notification and sends an email. The
script comes with a built-in rate limit scoped to the unit name to prevent spam.

It can be used like this:

```txt
OnFailure={{ onfailure_alert__systemd_unit_name | replace('@', '@%n') }}
```

Also comes with an example systemd unit that can be used to test the alert:

```sh
sudo systemctl start onfailure-alert-example.service
```

With this example, logs can be checked with:

```sh
sudo journalctl -u onfailure-alert@onfailure-alert-example.service.service
```

Clean up once testing is done:

```sh
sudo systemctl stop onfailure-alert-example.service
sudo systemctl reset-failed onfailure-alert-example.service
```

## Maintenance

### Update

Nothing to do.
