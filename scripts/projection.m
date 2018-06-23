function projection(num)
% attempt to decipher kitti notation

addpath('c:\users\pmm5983\downloads\predictions\')
addpath('c:\users\pmm5983\downloads\dataset\poses\')

%for seq=0:10
for seq=num

    try
        mg = load(sprintf('%02d.txt',seq));
        %mp = load(sprintf('%02d_p.txt',seq));
    catch
        continue
    end
    x = [0 0;0 0;0 1;1 1];
    resultsg = zeros(length(mg), 3);
    dists = zeros(length(mg),1);
    rots = zeros(length(mg),1);
    %resultsp = zeros(length(mp), 3);
    %figure;
    hold on;
    for i=1:length(mg)
        matg = reshape(mg(i,:), 4, 3)';
        %matp = reshape(mp(i,:), 4, 3)';
        yg = matg * x;
        %yp = matp * x;
        %resultsg(i,:) = yg';
        %plot3(yg(1,:), yg(3,:), yg(2,:))
        plot(yg(1,:), yg(3,:))
        yg = yg';
        dists(i) = sqrt(sum((yg(1,:) - yg(2,:)).^2));
        rots(i) = atan((yg(1,3)-yg(2,3))/(yg(1,1)-yg(2,1)));
        %resultsp(i,:) = yp';
    end
    %title(sprintf('Sequence %02d',seq))
    %figure;
    %hold on;
    %plot(dists)
    %plot(rots*180/pi)
%     figure;
%     hold on;
%     plot(resultsg(:,1),resultsg(:,3))
%     plot(resultsp(:,1),resultsp(:,3))
%     legend('Ground Truth', 'Prediction')
    xlabel('X Position (m)')
    ylabel('Z Position (m)')
    title(sprintf('Sequence %02d Localization', seq))
     %plot3(results(:,1),results(:,2),results(:,3))
%     print('-dpng', sprintf('seq_%02d_map_0.png',seq))
end
end