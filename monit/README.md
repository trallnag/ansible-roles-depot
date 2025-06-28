# Ansible role `monit`

Sets up Monit.

Monit is installed with APT. It is not kept up to date.

While the package includes a systemd service, it is overriden by this role. Why?
The included sandboxing make it impossible to use Monit to trigger arbitrary
scripts and such.

## Maintenance

### Update

Use APT to update Monit.
