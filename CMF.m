function [ji,jj] = CMF(J,yi_mass,yj_mass)
J=J*(10^3)/((10^4)*(3600));
fprintf('Total Mass Flux(J)=%.6f (g/(cm2*s))\n',J)
ji=(J*yi_mass*22.4*1000/(46.07));
jj=(J*yj_mass*22.4*1000/(18.01));
fprintf('Molar Flux for i(ji)=%.6f (cm3*STP/(cm2*s))\n',ji);
fprintf('Molar Flux for j(jj)=%.6f (cm3*STP/(cm2*s))\n',jj);
fprintf('Total Molar Flux=%.6f (cm3*STP/(cm2*s))\n',ji+jj);
end