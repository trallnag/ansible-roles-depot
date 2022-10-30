# Ansible Role `winsync`

Sync directories `~/.aws` and `~/.kube` from WSL to Windows.

**IMPORTANT:** Currently not in use. Does not work reliably. Windows-native
symbolic links are used instead to create in Windows that point to WSL.

```ps1
$distro = "Ubuntu-22.04"
$user = "trallnag"
New-Item -ItemType SymbolicLink -Path .aws -Target "\\wsl$\$distro\home\$user\.aws"
New-Item -ItemType SymbolicLink -Path .kube -Target "\\wsl$\$distro\home\$user\.kube"
```
