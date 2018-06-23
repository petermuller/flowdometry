These are only edits of the main program from the KITTI odometry evaluation software. Download that
from the KITTI dataset site, then use these to create binaries for sequences 08-10 overall, and
sequences 08-10 individually (4 binaries). Use the following command to compile (after copying
to the cpp folder of the evaluation source).

Download the source from: http://kitti.is.tue.mpg.de/kitti/devkit_odometry.zip

for i in {,_08,_09,_10}; do g++ -O3 -DNDEBUG -o evaluate_odometry${i} evaluate_odometry${i}.cpp matrix.cpp; done
