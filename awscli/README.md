> This role is not meant to be shared. It is only meant to be used by myself.
> I use this role in my playbooks by adding the repo as a Git submodule and
> symlinking roles I want into the roles directory of the respective playbook.

# Ansible Role `awscli`

- <https://github.com/aws/aws-cli>
- <https://github.com/aws/aws-cli/blob/v2/CHANGELOG.rst>

## FAQ

## How to change the installed version?

Go to [`tasks/main.yaml`](tasks/main.yaml) and set the version in the
"Import role trallnag.awscli" task.
