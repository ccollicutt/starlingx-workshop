# StarlingX Workshop Deployment With Ansible

This Ansible code will deploy infrastructure to Packet.com for use in a StarlingX workshop.

## Ansible Roles From Galaxy

```
ansible-galaxy install -r galaxy-requirements.yml
```

## Deploying Infrastructure

Ensure required [Packet.com](http://packet.com) environment variables are set.

```
PACKET_PROJECT_ID=<project id>
PACKET_KEY_NAME=<key name>
PACKET_API_TOKEN=<api token>
```

Run the playbook.

```
ansible-playbook all.yml
```