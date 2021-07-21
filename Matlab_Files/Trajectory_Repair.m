for i=1:length(traj)
    if(length(traj(i).x)~=4)
        traj(i).x=cat(2,traj(i).x,traj(i).x(end)*ones(1,4-length(traj(i).x)));
        traj(i).y=cat(2,traj(i).y,traj(i).y(end)*ones(1,4-length(traj(i).y)));
    end
end