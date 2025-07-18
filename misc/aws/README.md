# Ansible role `aws`

Sets up the AWS CLI and related components.

- AWS CLI v2: <https://github.com/aws/aws-cli/tree/v2>
- AWS SAM CLI: <https://github.com/aws/aws-sam-cli>
- AWS Session Manager Plugin: <https://github.com/aws/session-manager-plugin>

All components are installed without the use of package managers like APT.

The latest available versions of all components are installed. Previously
installed versions are overwritten.

## Maintenance

### Update

Run this role to update the AWS CLI and related components.
