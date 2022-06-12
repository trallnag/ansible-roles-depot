> This role is not meant to be shared. It is only meant to be used by myself.
> I use this role in my playbooks by adding the repo as a Git submodule and
> symlinking roles I want into the roles directory of the respective playbook.

# Ansible Role `rust`

Role that installs and configures the Rust development chain.

## FAQ

### How to update the Rust toolchain?

Must be done manually outside of Ansible.

    rustup self update && rustup update
