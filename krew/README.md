# Ansible Role `krew`

Installs Krew, the package manager for Kubectl plugins and several plugins.

- <https://github.com/kubernetes-sigs/krew>
- <https://krew.sigs.k8s.io/>

## Version Management

Whenever this role is run the latest version of Krew itself and all of the
configured Krew plugins will be installed.

To update and upgrade manually, execute:

    kubectl krew update
    kubectl krew upgrade
