Daily flow in units csm.
Cubic feet/sec/sq mile.

Convert from csm to mm:
(csm * 0.03719)25.4
or csm *0.944628132
ft^3/s/mile^2 * m^3/35.314667ft^3 * mile^2/2589988m^2 * 1000mm/m

Headers:
WYR, Month, Day, Flow (csm)

WYR= Nov 1 - Oct 31

0s indicate no flow due to weir down for repairs, data logger problems, etc.
Details of these instances are documented in notes in the filing cabinets in DP building breezeway.


f7_wsxx_2013.csv are the daily flow files by watershed for WYR 2013.


 why we often use the May-April water year:

“Because soils are consistently wet in May, the May-April water year minimizes differences in soil moisture storage between years ….”

I found it in:

http://onlinelibrary.wiley.com/doi/10.1029/WR011i005p00667/pdf

Pre-2017 data was processed using Fortran code. That data is in folder Daily_Flow_1935_2016_processed_via_Fortran 

In 2017 Dave Hawthorne wrote programs in Python language to process streamflow.
        This code harnessed the legacy Fortran.
        Program: make_wy_files.py is purely python code that creates a wateryear from data 
                 stored on the NAS in e_vault and formats it to run
                 in the Fortran matrix.
        Program: streamflow_via_fortran.py harnesses the Fortran and runs it without manual input.
	Addtional years were ran to provide comparison with original Fortran produced data without python
	The data is in folder Daily_Flow_2012_2016_processed_via_python_fortran 


In 2017 Dave Hawthorne wrote programs in Python language to process streamflow.
                Program: compute_discharge_from_head.py is purely python code that can create data 
                          in units "csm", "kl/ha/day", and "mm/day" in a variety of intervals (daily, monthly, etc)
                          using head data stored on the NAS in e_vault 
	The data is in folder Daily_Flow_processed_via_python
       




