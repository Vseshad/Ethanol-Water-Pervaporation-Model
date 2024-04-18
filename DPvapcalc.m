function [DPvapi,DPvapj] = DPvapcalc(molfraci,molfracj,gamai,gamaj,Pisat,Pjsat)
% Pfeed is Vapour pressure @ Feed side of component i & j (cmHg)
% Pperm is Vapour pressure @ Permeate side (Assumed=0(cmHg) due to high vaccum)
Pfeedi=molfraci*gamai*Pisat;
Pfeedj=molfracj*gamaj*Pjsat;
Ppermi=0; % Assumed
Ppermj=0; % Assumed
DPvapi=Pfeedi-Ppermi;
DPvapj=Pfeedj-Ppermj;
fprintf('DPvapi=%.3f (cmHg)\n',DPvapi);
fprintf('DPvapj=%.3f (cmHg)\n',DPvapj);
end