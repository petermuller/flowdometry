# Flowdometry

These are all the files associated with my thesis and published paper as organized as I can get them. The files are here to have them open-sourced, but they will not run out of the box. The KITTI dataset is used but there are many hardcoded references to where it was saved in the research cluster I used at RIT. You can download my thesis at http://scholarworks.rit.edu/theses/9316/ and my paper that was accepted into WACV 2017 at https://www.computer.org/csdl/proceedings/wacv/2017/4822/00/07926658.pdf

If you would like to cite this code or paper, please use the following citation:
```
P. Muller and A. Savakis, “Flowdometry: An Optical Flow and Deep Learning Based Approach to Visual Odometry,” IEEE Winter Applications on Computer Vision (WACV), March 2017.
```

## Directories

### default_configs_flow

Caffe model (model_train.prototxt) and supporting parameters for training the model with optical flow images and data.

### default_configs_raw

Caffe model (model_train.prototxt) and supporting parameters for training the model with raw images from the KITTI dataset.

### flownet-release

The FlowNet package that was used for grabbing the visual odometry layers in the Caffe model.

### gt

Ground truth values for training the network. The dataset itself is all the flow images generated from the KITTI dataset using the FlowNet architecture. That would be 166 GB, so it wasn't included here. The ground truth values included are the rotations and displacements as calculated from the incremental changes in ground truth values from the KITTI dataset. These ground truth databases also include the reverse direction because I trained the models on the vertically mirrored images (displacement stays the same, but the angle is negated).

### kitti_evaluation

Custom source files for evaluating individual paths in the KITTI dataset instead of evaluating the entire dataset.

### privatemodules

I needed to hack the FlowNet Caffe code into the research cluster, so this was a way of specifying the code that could be executed in the cluster instead of using the default Caffe provided with the system.

### scripts

These are any scripts that were used for generating data or interpreting data from the neural network model.

### slurm_scripts

These are the scripts that were used to issue batch compute jobs in the slurm-based research cluster at RIT.

