#!/bin/bash

#cp *.sh /home/pmm5983/loops/scripts
#cd /home/pmm5983/loops

cp *caffe*.sh /home/pmm5983/git_repos/caffe_code/slurm_scripts
cp flowcaffe/*txt /home/pmm5983/git_repos/caffe_code/default_configs_flow
cp caffe_flow_kitti/*txt /home/pmm5983/git_repos/caffe_code/default_configs_raw
cp flowcaffe/*.py /home/pmm5983/git_repos/caffe_code/scripts

cd /home/pmm5983/git_repos/caffe_code

git add *
git commit -a -m"[Auto-Backup] `date`"
git push origin master

