# Ansible role `minmon`

Sets up [MinMon](https://github.com/flo-at/minmon).

MinMon is installed from an artifact for a specific release on GitHub. It is not
kept up to date.

Includes monitoring of MinMon itself for errors by Monit. Alerts are send to
Windows via BurntToast.

Includes monitoring of Systemd for failed units.

## Maintenance

### Update

MinMon is pinned to a specific version in [`tasks/main.yaml`](tasks/main.yaml)
via the facts `minmon__target_tag` and `minmon__target_digest`.

Check the [flo-at/minmon][https://github.com/flo-at/minmon] repository on GitHub
for changes.

Adjust the values of the aforementioned facts to update MinMon.
