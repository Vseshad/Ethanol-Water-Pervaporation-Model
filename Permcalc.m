function [Fi,Fj] = Permcalc(ji,jj,DPvapi,DPvapj)
Fi=((ji)/(DPvapi*10^(-6)));
Fj=((jj)/(DPvapj*10^(-6)));
% gpu stands for gas permiation units
fprintf('Permeance of Ethanol(Fi)=%.5f(gpu)\n',Fi);
fprintf('Permeance of Water(Fj)=%.5f(gpu)\n',Fj);
end
