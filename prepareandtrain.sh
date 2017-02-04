source $(dirname $0)/_vars.sh

echo 

# extract all videos
$(dirname $0)/extractframes.sh $TFBASE/videos/*

# resize all images
find $TFBASE/images/originals -type f \( -name "*.jpg" -or -name "*.JPG" \) | xargs $(dirname $0)/resizeimage.sh # -f

# train
echo "Now ready to train"

$(dirname $0)/train.sh