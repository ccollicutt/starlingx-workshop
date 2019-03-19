# starlingx-workshop


## Lab Setup

```
virtualenv ~/venv/starlingx-workshop
. ~/venv/starlingx-workshop/bin/activate
pip install packet-python
pip install ansible
```

Ensure you have a packet cloud API token, project ID, and ssh key name.

```
export PACKET_PROJECT_ID=<project id>
export PACKET_API_TOKEN=<token>
export PACKET_KEY_NAME=<key name>
```

Run the playbook.

*NOTE: It may take several minutes for the packet.com nodes to become available.*

```
ansible-playbook all.yml
```

## Delete Infrastructure

Set `packet_node_state` to absent.

```
ansible-playbook provision-nodes.yml -e "packet_node_state=absent"
```