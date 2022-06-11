> This role is not meant to be shared. It is only used by myself.
> I use this role in my playbooks by adding the repo as a Git submodule.

# Ansible Role `asdf`

* <http://asdf-vm.com/>
* <https://github.com/asdf-vm/asdf>

## FAQ

### Change version of asdf?

Go to [`tasks/main.yaml`](tasks/main.yaml) and bump the version in the
`ansible.builtin.git` task.
