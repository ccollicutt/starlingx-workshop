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
export PACKET_PROJECT_ID=<id>
export PACKET_API_TOKEN=<token>
export PACKET_KEY_NAME=<key name>
```

