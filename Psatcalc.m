function [Pisat,Pjsat] = Psatcalc(T)
% A, B & C for Ethanol
if (T<=80)
Ai=8.20417;
Bi=1642.89;
Ci=230.3;
else
Ai=7.68117;
Bi=1332.04;
Ci=199.2;
end
% A, B & C for Water
if (T<=100)
Aj=8.07131;
Bj=1730.63;
Cj=233.426;
else
Aj=8.14019;
Bj=1810.94;
Cj=244.485;
end
Pisat=(10^(Ai-(Bi/(T+Ci))))*0.1;
Pjsat=(10^(Aj-(Bj/(T+Cj))))*0.1;
fprintf('Saturation Pressure for i (Pi_sat)=%.3f (cmHg)\n',Pisat);
fprintf('Saturation Pressure for j (Pj_sat)=%.3f (cmHg)\n',Pjsat);
end