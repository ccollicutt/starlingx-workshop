#!/bin/bash

# NOTE: Should perhaps be using docker save/load of multiple images?

repo="localhost:5000"

while read line; do
  image_name=`echo $line | cut -f 1 -d " "`
  image_tag=`echo $line | tr -s " " | cut -f 2 -d " "`
  echo "image is $image_name"
  echo "tag is $image_tag"
  # Removing the "repo" name from the images. Must be a better way?
  # config_controller looks for $repo/$short_name without repo name
  if [[ "$image_name" =~ quay* ]] ; then
    short_name=${image_name#"quay.io/"}
  elif [[ "$image_name" =~ k8s* ]] ; then
    short_name=${image_name#"k8s.gcr.io/"} 
  elif [[ "$image_name" =~ gcr* ]]  ; then
    short_name=${image_name#"gcr.io/"}
  else
    short_name=$image_name
  fi
  docker tag $image_name:$image_tag $repo/$short_name:$image_tag
  echo "INFO: docker push $repo/$short_name:$image_tag"
  docker push $repo/$short_name:$image_tag
  cat << EOF >> /tmp/images.yml
- name: "$image_name"
    tag: "$image_tag"
    short_name: "$short_name"
  EOF
done < images.txt

# curl -s -X GET http://localhost:5000/v2/_catalog
# curl -s -X GET http://10.99.235.9:5000/v2/_catalog


# while read line; do
#   image_name=`echo $line | cut -f 1 -d " "`
#   image_tag=`echo $line | tr -s " " | cut -f 2 -d " "`
#   echo "image is $image_name"
#   echo "tag is $image_tag"
#   short_name=`echo $image_name | cut -f 2 -d "/"`
#   echo "short_name is $short_name"
#   docker tag $image_name:$image_tag $repo/$short_name:$image_tag
#   # During install config_controller is looking for repo/shortname not the entire name I hav
#   docker push $repo/$short_name:$image_tag
# done < k8s-images.txt


# Alternative registry to k8s.gcr.io: 10.99.235.9:5000
# Alternative registry to gcr.io: 10.99.235.9:5000
# Alternative registry to quay.io: 10.99.235.9:5000
# Alternative registry to docker.io: 



curl -F "file=@controller-0_20190321.125831.tar" https://file.io
