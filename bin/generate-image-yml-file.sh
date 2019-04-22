#!/bin/bash

# NOTE: Should perhaps be using docker save/load of multiple images?

repo="localhost:5000"

echo "INFO: creating /tmp/images.yml"
echo "---" > /tmp/images.yml
echo "container_images:" > /tmp/images.yml
while read line; do
  image_name=`echo $line | cut -f 1 -d " "`
  image_tag=`echo $line | tr -s " " | cut -f 2 -d " "`
  echo "image is $image_name"
  echo "tag is $image_tag"
  clean_image_name=`echo $line | sed "s/\//_/g" | cut -f 1 -d " "`
  clean_image_tag=`echo $line | tr -s " " | sed "s/\//_/g" | cut -f 2 -d " "`
  save_file=$clean_image_name-$clean_image_tag.tgz  
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
#   docker tag $image_name:$image_tag $repo/$short_name:$image_tag
#   echo "INFO: docker push $repo/$short_name:$image_tag"
#   docker push $repo/$short_name:$image_tag
  cat << EOF >> /tmp/images.yml
  - name: "$image_name"
    tag: "$image_tag"
    short_name: "$short_name"
    file_name: "$save_file"
EOF
done < /tmp/images.txt

echo "INFO: place the contents of /tmp/images.yml into the default/main.yml file for"
echo "INFO: the docker-registry role"