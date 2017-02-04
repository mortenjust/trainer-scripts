[ -z "$SMALLIMAGES" ] && . $(dirname $0)/_vars.sh


if [ "$1" == "silently" ] ; then
    REPLY="Y"
else
    read -p "This will delete all caches. Are you sure? y/n" -n 1 -r
    echo    # (optional) move to a new line
fi

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # delete bottlenecks 
    rm -rf $TFBASE/bottlenecks \

    # delete resized images
    rm -rf $TFBASE/images/resized/*

    # delete logs
    rm -rf $TFBASE/*.txt
    
fi