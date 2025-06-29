# Ansible role `monit`

Sets up [Monit](https://mmonit.com/monit/).

Monit is installed with APT. It is not kept up to date.

While the package includes a systemd service, it is overriden by this role. Why?
The included sandboxing make it impossible to use Monit to trigger arbitrary
scripts and such.

Includes monitoring of Monit itself for errors by Monit. Alerts are send to
Windows via BurntToast.

## Maintenance

### Update

Use APT to update Monit.

Check the [release notes](https://mmonit.com/monit/changes/) for changes.
