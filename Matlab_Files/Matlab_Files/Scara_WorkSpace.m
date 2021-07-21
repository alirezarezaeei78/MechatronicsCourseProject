function WorkSpaceProps=Scara_WorkSpace(NumberOfPoints,ScaraRobotTree,UseExistedWorkSpace)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    arguments
        NumberOfPoints=5000;
        ScaraRobotTree=0;
        UseExistedWorkSpace = true;
    end

if (UseExistedWorkSpace==false)

    rev1=unifrnd(-pi,pi,[1,NumberOfPoints]);
    rev2=unifrnd(-pi,pi,[1,NumberOfPoints]);
    RobotConfig=ScaraRobotTree.randomConfiguration;
    
    figure(1);
    for i=1:NumberOfPoints
        RobotConfig(1).JointPosition=rev1(i);
        RobotConfig(2).JointPosition=rev2(i);
        tform=getTransform(ScaraRobotTree,RobotConfig,'endeffector','base');
        x_EE(i)=tform(1,4);
        y_EE(i)=tform(2,4);
        z_EE(i)=tform(3,4);
        scatter3(x_EE(i),y_EE(i),z_EE(i));

        hold on

    end
    save("ScaraWorkSpace",'x_EE','y_EE','z_EE','rev1','rev2');
    show(ScaraRobotTree,RobotConfig,'visuals','on','collision','off');

    hold off
    
    
    


else
    load('ScaraWorkSpace.mat')
    

    RobotConfig=ScaraRobotTree.randomConfiguration;

   
    x_EE=nonzeros(x_EE);
    y_EE=nonzeros(y_EE);


    figure()
    % % Minimum radial distance from base
    dum= x_EE(1)^2+y_EE(1)^2;
    min_r=dum;
    for i=1:length(x_EE)
        if(x_EE(i)^2+y_EE(i)^2<dum)
           dum=x_EE(i)^2+y_EE(i)^2; 
           min_r=sqrt(dum);
           Idx_min=i;
        end

    end 
    WorkSpaceProps.r_min=min_r;
    WorkSpaceProps.Idx_min=Idx_min;
    
    RobotConfig(1).JointPosition=rev1(Idx_min);
    RobotConfig(2).JointPosition=rev2(Idx_min);
    scatter3(x_EE(Idx_min),y_EE(Idx_min),z_EE(Idx_min));
    hold on
    show(ScaraRobotTree,RobotConfig,'visuals','on','collision','off');
    hold on
    % 
    % 
    % 
    % % Maximum radial distance from base

    
    for i=1:length(x_EE)
        
        scatter3(x_EE(i),y_EE(i),z_EE(i));
        i

        hold on

    end
    dum= x_EE(1)^2+y_EE(1)^2;
    max_r=dum;
    for i=1:length(x_EE)
        if(x_EE(i)^2+y_EE(i)^2>dum)
           dum=x_EE(i)^2+y_EE(i)^2; 
           max_r=sqrt(dum);
           Idx_max=i;
        end

    end 
    
    WorkSpaceProps.r_max=max_r;
    WorkSpaceProps.Idx_max=Idx_max;
    
    RobotConfig(1).JointPosition=rev1(Idx_max);
    RobotConfig(2).JointPosition=rev2(Idx_max);
    scatter3(x_EE(Idx_max),y_EE(Idx_max),z_EE(Idx_max));
    hold on
    show(ScaraRobotTree,RobotConfig,'visuals','on','collision','off');
    hold off




end

