# starlingx-workshop


## Lab Setup

Clone this repository.

```
git clone https://github.com/ccollicutt/starlingx-workshop
```

cd into the Ansible directory.

```
cd starlingx-workshop/ansible
```

Create a virtual env and installed required Python pip packages.

```
virtualenv ~/venv/starlingx-workshop
. ~/venv/starlingx-workshop/bin/activate
pip install packet-python
pip install ansible
```

Ensure you have a packet cloud API token, project ID, and ssh key name and that they are exported to your session.

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

At this point you should have as many nodes as you requested ready to run `virsh start controller-0` on.

## Delete Infrastructure

Set `packet_node_state` to absent.

*NOTE: This will delete all of the workshop nodes in your Packet.com project.*

```
ansible-playbook provision-nodes.yml -e "packet_node_state=absent"
```