# Ansible Role `awscli`

- <https://github.com/aws/aws-cli>
- <https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst>

## Version Management

To set the (to be) installed version, go to [`tasks/main.yaml`](tasks/main.yaml)
and adjust the parameter in the "Import role trallnag.awscli" task.

To retrieve a list of available versions, you can use the following command.

```shell
curl --range 0-$(( 5 * 1024 - 1 )) https://raw.githubusercontent.com/aws/aws-cli/v2/CHANGELOG.rst
```

The changelog file is atm quite large and so opening it in the browser through
the GitHub web UI does not work well. The `--range` limits the retrieved bytes
currently to 5 Kilobytes.
