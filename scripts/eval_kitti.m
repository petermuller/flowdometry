function eval_kitti(dl_txt, gt_txt)

lengths = 100:100:800;

%ground truth values
mg = load(gt_txt);
gt_points = zeros(size(mg,1),3);
for i=1:size(mg,1)
    gt_points(i,:) = [mg(i,4) mg(i,8) mg(i,12)];
end

all_data = load(dl_txt);
points = zeros(size(all_data,1)+1,3);
cur_pos = [0, 0, 0];
curr_rot = 90;

for i=1:size(all_data,1)
    curr_rot = curr_rot - all_data(i,2);
    cur_pos = [cur_pos(1)+all_data(i,1)*cosd(curr_rot), 0, cur_pos(3)+all_data(i,1)*sind(curr_rot)];
    points(i+1,:) = cur_pos;
end

for len=lengths
    
end


end