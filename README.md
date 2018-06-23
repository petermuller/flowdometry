# thesis_code

These are all the files associated with my thesis as organized as I can get them. The files are here to have them open-sourced, but they will not run out of the box. The KITTI dataset is used but there are many hardcoded references to where it was saved in the research cluster I used at RIT. You can download my thesis here: http://scholarworks.rit.edu/theses/9316/

## Directories

### default_configs_flow

Caffe model (model_train.prototxt) and supporting parameters for training the model with optical flow images and data.

### default_configs_raw

Caffe model (model_train.prototxt) and supporting parameters for training the model with raw images from the KITTI dataset.

### flownet-release

The FlowNet package that was used for grabbing the visual odometry layers in the Caffe model.

### kitti_evaluation

Custom source files for evaluating individual paths in the KITTI dataset instead of evaluating the entire dataset.

### privatemodules

I needed to hack the FlowNet Caffe code into the research cluster, so this was a way of specifying the code that could be executed in the cluster instead of using the default Caffe provided with the system.

### scripts

These are any scripts that were used for generating data or interpreting data from the neural network model.

### slurm_scripts

These are the scripts that were used to issue batch compute jobs in the slurm-based research cluster at RIT.

