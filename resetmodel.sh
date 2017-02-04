[ -z "$SMALLIMAGES" ] && . $(dirname $0)/_vars.sh

read -p "This will delete all caches. Are you sure? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # delete bottlenecks TODO

    # delete resized images
    rm $TFBASE/images/resized/*

    # delete logs
    rm $TFBASE/*.txt
    
fi