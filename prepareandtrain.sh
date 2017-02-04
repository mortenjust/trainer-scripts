source $(dirname $0)/_vars.sh

# extract all videos
extractframes.sh $TFBASE/videos/*

# resize all images
find $TFBASE/images/originals -type f \( -name "*.jpg" -or -name "*.JPG" \) | xargs resizeimage.sh # -f

# train
echo "Now ready to train"