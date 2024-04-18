function [J] = Fluxcalc(M2,a,t)
J=M2/(a*t);
fprintf('Total Mass Flux(J)=%.3f (kg/(m2*hr))\n',J)
end