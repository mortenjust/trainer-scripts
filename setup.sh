[ -z "$SMALLIMAGES" ] && . $(dirname $0)/_vars.sh

# create the files
mkdir -p $TFBASE/images
mkdir -p $TFBASE/images/originals
mkdir -p $TFBASE/videos
mkdir -p $TFBASE/model