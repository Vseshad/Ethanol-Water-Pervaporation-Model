function [xi_mole,yi_mole] = masstomole(xi_mass,yi_mass,M1,M2)
% Component i is Ethanol
% Component j is Water

Feedmass_i=xi_mass*M1;
Feedmass_j=M1-Feedmass_i;

Permmass_i=yi_mass*M2;
Permmass_j=M2-Permmass_i;

[xi_mole]=molecalc(Feedmass_i,Feedmass_j);
[yi_mole]=molecalc(Permmass_i,Permmass_j);
end