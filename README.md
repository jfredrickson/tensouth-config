# Configuration for tensouth.net

## Infrastructure

Uses Terraform to provision a S3 bucket and a backup user with appropriate permissions.

## Configuration

Uses Ansible to maintain system configuration on the server.

- Admin users
- SSH server
- Docker
- Firewall
- Backups to S3 _(not yet implemented)_

### Prerequisites

```
ansible-galaxy install geerlingguy.firewall geerlingguy.docker
```

### Initial deployment

1. Provision a server
2. Add the server IP address to the `inventory` file (see `inventory.sample`)
3. Copy `vars.sample.yml` to `vars.yml` and edit
4. Run initial configuration: `ansible-playbook site.yml -i inventory -u root -k`

At this point, the SSH port will change and root can no longer log in via SSH. Instead, use a sudo-enabled admin user as specified in `vars.yml`:

`ansible-playbook site.yml -i inventory -e ansible_ssh_port=YOUR_SSH_PORT --ask-become-pass`
