# takes a video file and extracts all frames
# videos can be named VIDEO-01.MOV or video.MOV or video.MPG and so on

source $(dirname $0)/_vars.sh

LOGFILE=$TFBASE/log-extracted-video-frames.txt

echo "large images in $LARGEIMAGES"

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: Usage: extractframes.sh videofile videofile videofile"
  exit 2
fi

# loop through all given videos, including those from e.g. /folder/*.MOV
for VIDEO in "$@"
do
    if grep -q $VIDEO $LOGFILE 
    then 
        echo "$VIDEO is already extracted. Exiting.";
        continue
    else
        echo "New video. Extracting.";
    fi

    # grab label from filename - /folder/folder/label-name.MOV = label-name
    filename=$(basename "$VIDEO")
    filename="${filename%.*}"
    LABEL=$(echo $filename | sed "s/[0-9]*$//") #remove trailing digits

    echo "Extracting frames for video label: $LABEL"

    mkdir -p $LARGEIMAGES/$LABEL

    ffmpeg -i "$VIDEO" -r 5 -qscale:v 2 $LARGEIMAGES/$LABEL/$LABEL%03d.jpg

    echo "$(date)  $VIDEO" >> $LOGFILE
done