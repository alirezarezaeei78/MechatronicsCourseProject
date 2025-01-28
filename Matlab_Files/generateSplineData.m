function generateSplineData(dxfChanged)
    % Input parameter dxfChanged should be true if DXF file was modified
    % or if this is the first run
    
    if ~dxfChanged && exist('Spline_mat.mat', 'file')
        % Load existing spline data if DXF hasn't changed
        load('Spline_mat.mat');
        disp('Loading existing spline data...');
    else
        % Generate new spline data if DXF changed or no existing data
        disp('Generating new spline data...');
        
        % Run the simulation
        open('Scara_simulink');
        out = sim('Scara_simulink');

        % Extract x and y coordinates from simulation output
        x_coords = out.x.Data;
        y_coords = out.y.Data;

        % Create initial N-by-3 matrix for Spline data
        Spline = zeros(length(x_coords), 3);
        for i = 1:length(x_coords)
            Spline(i,:) = [x_coords(i), y_coords(i), 0.025];
        end

        % Remove redundant points
        dum = out.tout;
        temp = [0,0,0];
        i = 1;

        while ~isempty(dum)
            dum(1) = [];
            try
                if (all(abs(temp-Spline(i,:)) < 1.0e-3))
                    Spline(i,:) = [];
                end
            catch Er
                break;
            end
            try
                temp = Spline(i,:);
            catch
                break;
            end
            i = i + 1;
        end

        % Save the new spline data
        save('Spline_mat.mat', 'Spline');
        disp('New spline data saved successfully.');
    end
    
    % Optional: Plot the trajectory to verify
    figure;
    plot3(Spline(:,1), Spline(:,2), Spline(:,3), 'b.-');
    grid on;
    title('End-Effector Trajectory');
    xlabel('X Position');
    ylabel('Y Position');
    zlabel('Z Position');
end