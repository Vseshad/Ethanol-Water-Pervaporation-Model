function [i_mole] = molecalc(mass_i,mass_j)
% MW of Ethanol(i) is 46
% MW of Water(j) is 18
mole_i=(mass_i*1000)/46;
mole_j=(mass_j*1000)/18;
i_mole=mole_i/(mole_i+mole_j);
end