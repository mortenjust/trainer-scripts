source $(dirname $0)/_vars.sh

# extract all videos
extractframes.sh $TFBASE/images/videos/*

# resize all images
find ~/tf_files/images/originals -type f \( -name "*.jpg" -or -name "*.JPG" \) | xargs resizeimage.sh # -f

# train
echo "Now ready to train"