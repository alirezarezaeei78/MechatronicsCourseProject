load('EE_Traj.mat')
for i=1:length(x)
    plot(x(i),y(i),'b*')
    hold on;
    pause(0.01);
end
hold off
