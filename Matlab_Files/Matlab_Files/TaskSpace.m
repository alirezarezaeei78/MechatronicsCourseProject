function SimParams = TaskSpace(Trajectory)

N=length(Trajectory);
Dof=N-1;

for i=1:N
    if(Trajectory{i}.type=="time")
        t=Trajectory{i}.value;
        Trajectory(i)=[];
        
    end
end


for i=1:Dof
    if(Trajectory{i}.type=="Trans")
        fldname=Trajectory{i}.name;
        SimParams.(fldname).value=[t',transpose(Trajectory{i}.value)];
        SimParams.(fldname).name=Trajectory{i}.name + num2str(i)+"(mm)" ;

    elseif(Trajectory{i}.type=="Rot")
        fldname=Trajectory{i}.name;
        SimParams.(fldname).value=[t',transpose(Trajectory{i}.value)];
        if(Trajectory{i}.name=="phi")
            SimParams.(fldname).name="\phi(deg)" ;
        elseif(Trajectory{i}.name=="theta")
            SimParams.(fldname).name="\theta(deg)" ;
        elseif(Trajectory{i}.name=="gama")
            SimParams.(fldname).name="\gama(deg)" ;
        end
    end
end

