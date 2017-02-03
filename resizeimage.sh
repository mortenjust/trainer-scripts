start_time=`date +%s`
source $(dirname $0)/_vars.sh

LOGFILE=$TFBASE/log-resized-images.txt


if [ $# -lt 1 ]; then
  echo 1>&2 "$0: No image folder specified"
  exit 2
fi

# usage 
#       Files:      resizeimages.sh filename
#       Folders:    resizeimages.sh folder/*
#       Wildcards:  resizeimages.sh ./*.JPEG
#       Recursive:  find ~/tf_files/images/originals -type f | xargs ./resizeimage.sh -f

for IMAGE in "$@"
do
    if grep -q $IMAGE $LOGFILE 
    then 
        echo "$IMAGE is already resized. Skipping.";
        continue
    fi

    # grab label from foldername - /folder/label-name/image.JPG = label-name
    LABEL=$(basename $(dirname $IMAGE))

    echo "Resizing $(basename $IMAGE) for label $LABEL"

    mkdir -p $SMALLIMAGES/$LABEL

    convert "$IMAGE" -resize 200 "$SMALLIMAGES/$LABEL/small-$(basename $IMAGE)"

    echo "$(date)  $IMAGE" >> $LOGFILE
done
echo "Done. Took $(expr `date +%s` - $start_time)s"