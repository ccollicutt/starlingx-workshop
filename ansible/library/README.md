## packet_node

We needed to be able to tag instances on creation. The upstream `packet_device` module does not support adding tags, so we've imported that module here and added that functionality, and have renamed the module `packet_node` so there is no confusion. This is a simple change and we'll work to upstream it, but it takes time to get a module change accepted.