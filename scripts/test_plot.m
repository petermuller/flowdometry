function test_plot(dist_txt, rot_txt)
try
    dists = load(dist_txt);
    rots = load(rot_txt);

    points = zeros(size(dists,1)+1,2);

    cur_pos = [0, 0];
    curr_rot = 90;

    for i=1:size(dists,1)
        curr_rot = curr_rot - rots(i);
        cur_pos = [cur_pos(1)+dists(i)*cosd(curr_rot) , cur_pos(2)+dists(i)*sind(curr_rot)];
        points(i+1,:) = cur_pos;
    end

    figure;
    plot(points(:,1), points(:,2));
    ylabel('Z (m)');
    xlabel('X (m)');
    title(sprintf('%s %s',dist_txt,rot_txt), 'interpreter', 'none')
catch
    disp(sprintf('%s %s',dist_txt,rot_txt))
end