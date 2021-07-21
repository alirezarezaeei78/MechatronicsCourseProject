function  PlotTraj(Traj)


%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i=length(Traj):-1:1
   x=Traj(i).x;
   y=Traj(i).y;
   plot3(x,y,zeros(1,4),Color='black')
%    pause(DrawDelay);
   title('X-Y Traj');
   hold on
end
hold off
end

 