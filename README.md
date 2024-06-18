# RHESSys74 R Markdown
 R Markdown to Initialize, Calibrate, and Validate RHESSys on Coweeta landscape

 This script requires Windows Subsystem Via Linux to run 

Necessary input files in input_files folder

Created model files and outputs in extdata folder

Step1_ModelandInputFiles
	
 Downloads and installs RHESSys, downloads and prepares necessary input datasets.
 
Step2_Spinup
	
 Initializes vegetation on the landscape with a ~500 year spinup period.
 
Step3_PrepareObservedData
	
 Downloads and prepares necessary observed streamflow and observed soil moisture datasets.
 
Step4_Calibration
	
 Calibrates the model utilizing 12 calibration parameters. 
 
Step5_Validation
	
 Validates model calibration for fit to streamflow and soil moisture.
 

![image](https://github.com/CQuin042/RHESSys74-R-Markdown/assets/78384584/d94e3ec3-525a-46b9-874b-c004e0ec939e)
