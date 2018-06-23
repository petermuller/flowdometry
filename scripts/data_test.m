%% Quick test
a = load('08.txt');

p = [0 0; 0 0; 0 5; 1 1];

figure;

for i=1:size(a,1)
    t = (reshape(a(i,:),4,3)' * p)';
    plot(t(:,1), t(:,3));
end

