#!/bin/bash

while read line; do
  image_name=`echo $line | cut -f 1 -d " "`
  image_tag=`echo $line | tr -s " " | cut -f 2 -d " "`
  clean_image_name=`echo $line | sed "s/\//_/g" | cut -f 1 -d " "`
  clean_image_tag=`echo $line | tr -s " " | sed "s/\//_/g" | cut -f 2 -d " "`
  echo "image is $image_name"
  echo "tag is $image_tag"
  save_file=$clean_image_name-$clean_image_tag.tgz
if [[ "$(docker images -q $image_name:$image_tag 2> /dev/null)" != "" ]]; then
    echo "$image_name:$image_tag already exists, skipping..."
  else
    # NOTE(curtis): docker import does not keep the entrypoint cmd, weird
    #docker import  $save_file $image_name:$image_tag
    docker load -i $save_file
  fi
done < images.txt