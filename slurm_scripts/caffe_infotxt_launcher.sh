#!/bin/bash -l
#
# 
# If you need any help, please email rc-help@rit.edu
#

#SBATCH -J caffe_launcher                        #name
#SBATCH -o pmmcaffe_it_%J.output         #normal output
#SBATCH -e pmmcaffe_it_%J.output         #error output
##SBATCH --mail-user=<insert your address here>
##SBATCH --mail-type=ALL
#SBATCH -t 0-00:05                   #time to run D-HH:MM
#SBATCH -p work                      #partition
#SBATCH -c 1                         #num cpu
##SBATCH --gres=gpu:1                 #use gpu(s)
#SBATCH --mem-per-cpu=128           #memory (MB)
#SBATCH --qos=free                   #quality of service
#SBATCH --export=ALL                 #variables
##SBATCH -O                           #overcommit resources

#
# Your job script goes below this line.  
#
echo "(${HOSTNAME}) Starting job"
#module load caffe/2016-03-08

######### PARAMS: $1 is slurm id, $2 is sequence number, $3 is iteration number


# enter your commands here
source activate env
cd caffe_flow_kitti/${1}
python ../get_infotxts.py out_dist_${2}_${3} out_rot_${2}_${3}
#cat model_train.prototxt | sed 's/batch_size: .*/batch_size: 1/g' | sed "s?image_train_00.txt?../test_lists/${2}_0_test.txt?" | sed "s?image_train_01.txt?../test_lists/${2}_1_test.txt?" > model_${2}_test.prototxt
#extract_features flow_kitti_d_iter_${3}.caffemodel model_${2}_test.prototxt out_dist,out_rot out_dist_${2}_${3},out_rot_${2}_${3} `wc -l ../test_lists/${2}_0_test.txt | awk '{print $1}'` lmdb GPU

#caffe train --solver=solver4.prototxt
#caffe test -model /home/pmm5983/caffe_kitti/myConvNet3.prototxt -weights /home/pmm5983/caffe_kitti/training_3_iter_100000.caffemodel -gpu 0 -iterations 4660
#extract_features /home/pmm5983/caffe/models/bvlc_alexnet/bvlc_alexnet.caffemodel /home/pmm5983/caffe/models/bvlc_alexnet/features.prototxt pool5 alexnet_out_personal_contexts 24000 lmdb GPU
#extract_features /home/pmm5983/caffe/models/bvlc_googlenet/bvlc_googlenet.caffemodel /home/pmm5983/caffe/models/bvlc_googlenet/features.prototxt "pool5/7x7_s1" googlenet_out_personal_contexts 24000 lmdb GPU
#python read_db.py net_out
source deactivate
echo "(${HOSTNAME}) Done" 
#echo "Job ${SLURM_JOB_ID} Finished" | mail -s "Job Finished" pmm5983@rit.edu
