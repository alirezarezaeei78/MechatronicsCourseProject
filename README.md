# SCARA Robot Simulation Project

## Prerequisites
- MATLAB (R2019b or newer)
- Simscape Multibody toolbox
- Simscape Multibody Parts Library

## Setup Instructions

### 1. Install Required Libraries

#### Installing Simscape Multibody Parts Library
There are two ways to install the required Simscape Multibody Parts Library:

##### Option 1: Via MATLAB File Exchange
1. Visit MATLAB File Exchange and search for "Simscape Multibody Parts Library"
2. Download and install directly from MATLAB File Exchange
3. Extract the files to your local machine (you should see a folder named `mathworks-Simscape-Multibody-Parts-Library-24.2.4.1`)
4. Open MATLAB
5. Double-click on `Multibody_Parts_Library.prj` to open the project

##### Option 2: Via MATLAB Online
1. Access the library through MATLAB Online
2. Follow the installation prompts

### 2. Add Required Folders to MATLAB Path

1. Open MATLAB
2. Right-click on the following folders in MATLAB's Current Folder browser and select "Add to Path" → "Selected Folders and Subfolders":
   - `MechatronicsCourseProject/Matlab_Files`
   - `mathworks-Simscape-Multibody-Parts-Library-24.2.4.1` (This is crucial for the project to work for matlab 2024b)

To verify the path is set correctly:
1. Type `pathtool` in MATLAB command window
2. Check that both folders appear in the path list
3. Click "Save" to make these path changes permanent

### 3. Common Issues and Fixes

#### Error: Missing Extr_Data_LinkHoles Function
If you encounter the error:
```
Undefined function 'Extr_Data_LinkHoles' for input arguments of type 'double'
```
This means the required function for defining hole positions in robot links is missing. Make sure:
1. All project files are properly copied
2. The MATLAB path includes all necessary folders
3. The Simscape Multibody Parts Library is properly installed

#### Error: Failed to load Multibody_Parts_Lib
If you see:
```
Failed to load library 'Multibody_Parts_Lib'
```
This indicates the Simscape Multibody Parts Library is not properly installed or not in your MATLAB path. Follow the installation instructions above to resolve this.

## Running the Project

1. Open MATLAB
2. Navigate to the project folder
3. Open `Main.mlx`
4. Ensure the working directory is set correctly:
   ```matlab
   cd('path_to_your_project/MechatronicsCourseProject/Matlab_Files')
   ```
5. Run the script

## Project Structure

- `Main.mlx`: Main script to run the simulation
- `Scara_simulink.slx`: Simulink model of the SCARA robot
- `Scara_WorkSpace.m`: Workspace analysis functions
- Various STEP files: 3D models of robot components

## Compatibility
- MATLAB versions: R2019b - R2023a
- Required toolboxes:
  - Simscape
  - Simscape Multibody
  - Simulink

## Troubleshooting

If you encounter any issues:
1. Verify all required toolboxes are installed
2. Check MATLAB version compatibility
3. Ensure all paths are correctly set
4. Verify the Simscape Multibody Parts Library is properly installed
