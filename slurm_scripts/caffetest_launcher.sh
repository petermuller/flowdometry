for i in {5000..100000..5000}; do
  sbatch caffe_launcher.sh $i
done
