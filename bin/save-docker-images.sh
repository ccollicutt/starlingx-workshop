#!/bin/bash

# images.txt is generated from an install of stx and just running:
# docker images | grep -v "<repos>" 
while read line; do
  image_name=`echo $line | cut -f 1 -d " "`
  image_tag=`echo $line | tr -s " " | cut -f 2 -d " "`
  clean_image_name=`echo $line | sed "s/\//_/g" | cut -f 1 -d " "`
  clean_image_tag=`echo $line | tr -s " " | sed "s/\//_/g" | cut -f 2 -d " "`
  echo "image is $image_name"
  echo "tag is $image_tag"
  save_file=$clean_image_name-$clean_image_tag.tgz
  if [ -f $save_file ]; then
    echo "$save_file already exists, skipping..."
  else
    docker save $image_name:$image_tag | gzip > $save_file
  fi
done < images.txt