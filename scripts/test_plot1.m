function test_plot1(txt_file)
addpath('c:\users\pmm5983\downloads\dataset\poses\')
try
    all_data = load(txt_file);

    points = zeros(size(all_data,1)+1,2);

    cur_pos = [0, 0];
    curr_rot = 90;

    for i=1:size(all_data,1)
        prev_rot = curr_rot;
        curr_rot = curr_rot - all_data(i,2);
%         if abs(prev_rot - curr_rot)/all_data(i,1) < 3
%             curr_rot = prev_rot;
%         else
%             curr_rot = curr_rot + .45;
%         end
        cur_pos = [cur_pos(1)+all_data(i,1)*cosd(curr_rot) , cur_pos(2)+all_data(i,1)*sind(curr_rot)];
        points(i+1,:) = cur_pos;
    end

    figure;
    plot(points(:,1), points(:,2));
    ylabel('Z (m)');
    xlabel('X (m)');
    title(sprintf('%s',txt_file), 'interpreter', 'none')
    projection(str2num(txt_file(19:20)))
catch
    disp(sprintf('%s',txt_file))
end