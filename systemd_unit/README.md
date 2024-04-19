# Ansible Role `systemd_unit`

Requires root privileges.

## Examples

Single service from a template with privilege escalation:

```yaml
- ansible.builtin.include_role:
    name: systemd_unit
    apply:
      become: true
  vars:
    systemd_unit: "{{ item }}"
    systemd_unit_content: "{{ lookup('ansible.builtin.template', item) }}"
    systemd_unit_activate: true
  loop:
    - ssh-agent-relay.service
```
