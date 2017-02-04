# do we have our vars (are we embedded)? If not, run _vars
[ -z "$SMALLIMAGES" ] && . $(dirname $0)/_vars.sh


# TODO use $TFBASE

python /tensorflow/tensorflow/examples/image_retraining/retrain.py \
--bottleneck_dir=$TFBASE/bottlenecks \
--model_dir=$TFBASE/inception \
--output_graph=$TFBASE/model/retrained_graph.pb \
--output_labels=$TFBASE/model/retrained_labels.txt \
--image_dir $TFBASE/images/resized

## faster and worse:
# python /tensorflow/tensorflow/examples/image_retraining/retrain.py \
# --bottleneck_dir=$TFBASE/bottlenecks \
# --how_many_training_steps 500 \
# --model_dir=$TFBASE/inception \
# --output_graph=$TFBASE/model/retrained_graph.pb \
# --output_labels=$TFBASE/model/retrained_labels.txt \
# --image_dir $TFBASE/images/resized