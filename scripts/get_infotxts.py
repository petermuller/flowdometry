#!/usr/bin/env python

import sys
import lmdb
import numpy as np
import os

if len(sys.argv) != 3:
  raise Exception("Usage: get_infotxts.py dist_db rot_db")

distance_loc = sys.argv[1]
rotation_loc = sys.argv[2]

print(os.listdir(distance_loc))
print(os.listdir(rotation_loc))

dist_db = lmdb.open(distance_loc)
rot_db = lmdb.open(rotation_loc)

dists = np.zeros(1, np.float32) +12345
rots = np.zeros(1, np.float32) +12345

with dist_db.begin() as txn:
  with txn.cursor() as cursor:
    for key, val in cursor:
      #print(key,np.fromstring(val[-4:], np.float32))
      if dists[0] == 12345:
        dists[0] = np.fromstring(val[-4:], np.float32)
      else:
        dists = np.append(dists, np.fromstring(val[-4:], np.float32))

with rot_db.begin() as txn:
  with txn.cursor() as cursor:
    for key, val in cursor:
      #print(key,np.fromstring(val[-4:], np.float32))
      if rots[0] == 12345:
        rots[0] = np.fromstring(val[-4:], np.float32)
      else:
        rots = np.append(rots, np.fromstring(val[-4:], np.float32))

all_data = np.append(dists,rots).reshape(2,-1).transpose((1,0))


np.savetxt("%s_%s.txt" % (distance_loc, rotation_loc), all_data)


cur_pos = [0,0]
cur_rot = 90
mats = np.zeros((rots.shape[0]+1,12))

mats[0,0] = 1
mats[0,5] = 1
mats[0,10] = 1

for i in range(rots.shape[0]):
  cur_rot = cur_rot - rots[i]
  cur_pos = [cur_pos[0]+dists[i]*np.cos((cur_rot)*np.pi/180), cur_pos[1]+dists[i]*np.sin((cur_rot)*np.pi/180)]

  mats[i+1,0] = np.cos((cur_rot-90)*np.pi/180)
  mats[i+1,2] = -np.sin((cur_rot-90)*np.pi/180)
  mats[i+1,3] = cur_pos[0]
  mats[i+1,5] = 1
  mats[i+1,8] = np.sin((cur_rot-90)*np.pi/180)
  mats[i+1,10] = np.cos((cur_rot-90)*np.pi/180)
  mats[i+1,11] = cur_pos[1]

np.savetxt("%s_%s.txt_mat.txt" % (distance_loc, rotation_loc), mats)

