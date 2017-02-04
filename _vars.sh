
echo $TFBASE

if [ -z $TFBASE ]
    then 
        echo "First do this: export TFBASE=/path/to/tf_files" ; 
        exit 1
    else 
        echo "TFBASE set" ; 
fi

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