load('EE_Traj.mat')
dum=out.tout;
temp=[0,0,0];
for i=1:length(x)
    Spline(i,:)=[x(i),y(i),0.025];
end
i=1;

while ~isempty(dum)
    dum(1)=[];
    
    try
        if (all(abs(temp-Spline(i,:))<1.0e-3))
            Spline(i,:)=[];
        end
    catch Er
        break;
    end
    try
        temp=Spline(i,:);
    catch
        break;
    end
    i=i+1;
   
end
save('Spline_mat','Spline')