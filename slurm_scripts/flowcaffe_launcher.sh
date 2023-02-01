#!/bin/bash -l
#
# 
# If you need any help, please email rc-help@rit.edu
#

#SBATCH -J caffe_launcher                        #name
#SBATCH -o pmmcaffe_flow_%J.output         #normal output
#SBATCH -e pmmcaffe_flow_%J.output         #error output
##SBATCH --mail-user=<insert your address here>
##SBATCH --mail-type=ALL
#SBATCH -t 1-00:00                   #time to run D-HH:MM
#SBATCH -p work                      #partition
#SBATCH -c 1                         #num cpu
#SBATCH --gres=gpu:1                 #use gpu(s)
#SBATCH --mem-per-cpu=2048           #memory (MB)
#SBATCH --qos=free                   #quality of service
#SBATCH --export=ALL                 #variables
##SBATCH -O                           #overcommit resources

#
# Your job script goes below this line.  
#
echo "(${HOSTNAME}) Starting job"
module unload opencv/2.4.11
module load use.own
module load caffe/2016-06-24

# enter your commands here
cd flowcaffe
mkdir ${SLURM_JOB_ID}
cp solver.prototxt train.txt train_gt.txt train_exp.txt train_exp_gt.txt model_train.prototxt ${SLURM_JOB_ID}
cd ${SLURM_JOB_ID}
### Make any sed / awk modifications here    1241 --- 600 --- 376
#sed -i 's/new_height: 376/new_height: 376/g' model_train.prototxt
#sed -i 's/new_width: 1241/new_width: 376/g' model_train.prototxt
sed -i 's/batch_size: 4/batch_size: 4/g' model_train.prototxt
sed -i 's/train.txt/train_exp.txt/' model_train.prototxt
sed -i 's/train_gt.txt/train_exp_gt.txt/' model_train.prototxt
sed -i 's/num_output: $NUM_OUT/num_output: 1024/g' model_train.prototxt

sed -i 's/max_iter: 100000/max_iter: 50000/' solver.prototxt
#sed -i 's/base_lr: 0.00001/base_lr: 0.01/' solver.prototxt

####caffe train --solver=solver.prototxt --snapshot=flow_kitti_d_iter_25000.solverstate
caffe train --solver=solver.prototxt

#caffe test -model /home/pmm5983/caffe_kitti/myConvNet3.prototxt -weights /home/pmm5983/caffe_kitti/training_3_iter_100000.caffemodel -gpu 0 -iterations 4660
#extract_features /home/pmm5983/caffe_kitti/training_3_iter_${1}.caffemodel /home/pmm5983/caffe_kitti/myConvNet3.prototxt dense2 net_out_${1} 2270 lmdb GPU
#python read_db.py net_out

echo "(${HOSTNAME}) Done" 
#echo "Job ${SLURM_JOB_ID} Finished" | mail -s "Job Finished" -r "pmm5983@rit.edu" pmm5983@rit.edu
