# Ansible role `msmtp`

Sets up msmtp and related tools.

Msmtp and related tools are installed with APT.

Msmtp is configured to use the SMTP server provided by Amazon SES.

Emails can be sent for example with the `mail` command like this:

```shell
echo "Message" | mail -s "Subject" default
```

## Maintenance

### Update

Use APT to update msmtp and related tools.
