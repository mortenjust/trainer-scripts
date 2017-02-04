#!/bin/bash

echo $TFBASE

if [ -z $TFBASE ]
    then 
        echo "Recommended: export TFBASE=/path/to/tf_files" ; 
        echo "Using /tf_files" ;
        export TFBASE=/tf_files      
    else 
        echo "TFBASE set" ; 
fi

mkdir -p $TFBASE/images
mkdir -p $TFBASE/images/originals
mkdir -p $TFBASE/images/resized
mkdir -p $TFBASE/videos
mkdir -p $TFBASE/model

echo processing images from $TFBASE

LARGEIMAGES=$TFBASE/images/originals
SMALLIMAGES=$TFBASE/images/resized
VIDEOS=$TFBASE/videos
MODEL=$TFBASE/model

echo "
LARGEIMAGES: $LARGEIMAGES
SMALLIMAGES: $SMALLIMAGES
VIDEOS: $VIDEOS
MODEL: $MODEL
"