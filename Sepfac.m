function [Bij] = Sepfac(xi_mole,yi_mole)
xj_mole=1-xi_mole;
yj_mole=1-yi_mole;
Bij=(yi_mole/yj_mole)/(xi_mole/xj_mole);
fprintf('Seperation Factor(Bij)=%.3f \n',Bij)
end