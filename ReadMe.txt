This is a Matlab code used to calculate Membrane Pervaporation Parameters for the Ethanol(i)-Water(j) system

PROCEDURE
Step 1) Selectivity Calculation
	
	Enter Input Parameters:- Feed Mass(kg), Permeate Mass(kg), Membrane Area(m^2)
	Output Parameter:- Selectivity is calculated in mass units(kg/m^2*hr)

Step 2) Mass & Mole Fraction Estimation
	
	Enter input Parameters:- Mass fraction of i in feed, Mass fraction of i in permeate
	Output Parameters:- Remaining Mass and Mole fractions in feed and permeate (Check  Matlab Workspace)

	On the backend Component Molar Flux is estimated in molar units (cm3*STP/(cm2*s) for i & j across the membrane along with the Separation Factor.

Step 3) Activity Coefficient Estimation

	Enter Input Parameters:- Feed Temperature(C)
	Output Parameter:- gama_i & gama_j

	On the backend, Saturation Pressure is Estimated from Antonie's equation(cmHg) along with the Differential Vapour Pressure of components i & j
	Permeance is also calculated (gpu) along with Ethanol-Water System Selectivity for the selected Membrane.
	
NOTES
1) If some of the parameters are not available manually enter selected values in the code to get results.
2) Sometimes the Excelui sheet may give some pop-up messages to update the sheet to the latest format which can be canceled and the code will continue running(if you use the Excelui method).
3) If there are error messages after you enter Temperature values run the code again and it will fix itself most of the time.
4) If it does not fix itself populate the mole fraction of i and j in the feed into the Excel sheet UNIFAC_VLE and manually enter gama i & j in the code and comment the [gamai,gamaj]=Excelui(T,xi_mole,xj_mole); line.
5) The model is validated with multiple research papers.
6) If you use the manual entry for Mass Flux calculation you would have to also use manual entry for The mass and mole fraction part so uncomment code accordingly.