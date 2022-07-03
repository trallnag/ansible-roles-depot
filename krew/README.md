# Ansible Role `krew`

Installs Krew, the package manager for Kubectl plugins and several plugins.

- <https://github.com/kubernetes-sigs/krew>
- <https://krew.sigs.k8s.io/>

## Caveats

- Expects kubectl to be installed with asdf.

## Included Plugins

- [access-matrix / rakkess](https://github.com/corneliusweig/rakkess)
- [cert-manager](https://github.com/cert-manager/cert-manager)
- [deprecations / kubepug](https://github.com/rikatz/kubepug)
- [explore](https://github.com/keisku/kubectl-explore)
- [fields](https://github.com/rewanthtammana/kubectl-fields)
- [fuzzy](https://github.com/d-kuro/kubectl-fuzzy)
- [images](https://github.com/chenjiandongx/kubectl-images)
- [ktop](https://github.com/vladimirvivien/ktop)
- [lineage](https://github.com/tohjustin/kube-lineage)
- [neat](https://github.com/itaysk/kubectl-neat)
- [resource-capacity](https://github.com/robscott/kube-capacity)
- [score](https://github.com/zegl/kube-score)
- [who-can](https://github.com/aquasecurity/kubectl-who-can)

Hint: Use `kubectl krew info <plugin>` for more information.

## Version Management

Whenever this role is run the latest version of Krew itself and all of the
configured Krew plugins will be installed.

To update and upgrade manually, execute:

    kubectl krew update
    kubectl krew upgrade
