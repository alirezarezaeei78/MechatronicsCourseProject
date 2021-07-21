function cellInfo = BusObjects(varargin) 
% BUSOBJECTS returns a cell array containing bus object information 
% 
% Optional Input: 'false' will suppress a call to Simulink.Bus.cellToObject 
%                 when the MATLAB file is executed. 
% The order of bus element attributes is as follows:
%   ElementName, Dimensions, DataType, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description 

suppressObject = false; 
if nargin == 1 && islogical(varargin{1}) && varargin{1} == false 
    suppressObject = true; 
elseif nargin > 1 
    error('Invalid input argument(s) encountered'); 
end 

cellInfo = { ... 
  { ... 
    'EE_Pose', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', ... 
    '0', {... 
{'Position', 1, 'Position', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'EE_Pose_simscape_out', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', ... 
    '0', {... 
{'x', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'y', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'JointParams', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', ... 
    '0', {... 
{'theta2', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'theta1', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'d', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'Org_traj', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', ... 
    '0', {... 
{'y', [1 4], 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'x', [1 4], 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
  { ... 
    'Position', ... 
    '', ... 
    '', ... 
    'Auto', ... 
    '-1', ... 
    '0', {... 
{'x', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'y', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
{'z', 1, 'double', 'real', 'Sample', 'Fixed', [], [], '', ''}; ...
    } ...
  } ...
}'; 

if ~suppressObject 
    % Create bus objects in the MATLAB base workspace 
    Simulink.Bus.cellToObject(cellInfo) 
end 
