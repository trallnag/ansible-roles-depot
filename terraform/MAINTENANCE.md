# Maintenance

## Update Terraform

Run this role to update Terraform.

## Clean up unused versions of Terraform

Every run of this role installs the latest available version of Terraform.
Previously installed versions are kept. To remove older unused versions, run,
for example, the following command:

```sh
tenv tf uninstall not-used-for:90d
```
