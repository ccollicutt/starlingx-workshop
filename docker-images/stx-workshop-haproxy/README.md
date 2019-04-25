# stx-workshop-haproxy

This image will port forward 31000 to 10.10.10.2:31000 to be able to access the Horizon web interface remotely.

Note that the image name is used in the `horizon-proxy` Ansible role.

## Build Image

```
 docker build . -t stx-workshop-haproxy
```

## Push to Docker Hub

```
export USER=<username>
docker login --username=$USER
docker tag <image id> $USER/stx-workshop-haproxy
docker push $USER/stx-workshop-haproxy
```