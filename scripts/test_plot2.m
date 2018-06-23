function test_plot2(txt_file)

addpath('c:\users\pmm5983\downloads\dataset\poses\')
%legend_labels = {};

%%% Handle Prediction Data

try
    all_data = load(txt_file);
    points = zeros(size(all_data,1)+1,2);

    cur_pos = [0, 0];
    curr_rot = 90;

    rots = zeros(size(all_data+1,1),1);
    
    for i=1:size(all_data,1)
        prev_rot = curr_rot;
        curr_rot = curr_rot - all_data(i,2);
        rots(i+1)=curr_rot;
%          if abs((prev_rot - curr_rot)/all_data(i,1)) < .01
%              curr_rot = prev_rot;
%           else
%               curr_rot = curr_rot + .00155;
%          end
        cur_pos = [cur_pos(1)+all_data(i,1)*cosd(curr_rot) , cur_pos(2)+all_data(i,1)*sind(curr_rot)];
        points(i+1,:) = cur_pos;
    end
    figure;
    
    %%% Get Ground Truth Data and Plot It
    seq = str2num(txt_file(19:20));
    try
        mg = load(sprintf('%02d.txt',seq));
        gt_points = zeros(size(mg,1),2);
        for i=1:size(mg,1)
            gt_points(i,:) = [mg(i,4) mg(i,12)];
        end
        plot(gt_points(:,1), gt_points(:,2), 'DisplayName', 'Ground Truth')
        hold on;
        %legend_labels = {'Ground Truth'};
        loss = norm(gt_points-points);
        disp(sprintf('Loss = %e, %s', loss, txt_file))
    catch
        disp(sprintf('%02d.txt',seq));
    end


    %% Plot Predictions

    %legend_labels = {legend_labels; 'Prediction'};
    plot(points(:,1), points(:,2), 'DisplayName', 'Predictions');
    ylabel('Z (m)');
    xlabel('X (m)');
    legend('-DynamicLegend','location','northwest')
    title(sprintf('%s',txt_file), 'interpreter', 'none')
    %title(sprintf('Sequence %02d Localization, Iteration 20000, Model 12', seq), 'interpreter', 'none')

catch
    disp(sprintf('%s',txt_file));
end

newp = zeros(size(mg));
newp(:,4)=points(:,1);
newp(:,12)=points(:,2);
newp(:,1)=cosd(rots);
newp(:,3)=-sind(rots);
newp(:,6)=1;
newp(:,9)=sind(rots);
newp(:,11)=cosd(rots);
fid=fopen('res.txt','w');
fprintf(fid,'%e %e %e %e %e %e %e %e %e %e %e %e\n',newp');
fclose(fid);

end