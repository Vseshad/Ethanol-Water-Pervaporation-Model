%% Notes
% (1)Ethanol - (2)Water  
% Input x_ethanol=x(1) & x_water=x(2) (length(x) > 2) 
% C=Captal, S=Sum (for variable annotation)
T=T+273.15; % Temperature in K
%% Component Structure
N = [1, 0;  % CH3
     1, 0;  % CH2
     1, 0;  % OH
     0, 1]; % H2O

%% Thermodynamic Data
%    CH3     CH2     OH   H20
R = [0.9011, 0.6744, 1.0, 0.92];
Q = [0.8480, 0.5400, 1.2, 1.40];
%    CH3    CH2    OH      H2O
a = [0    , 0    , 986.5 , 1318  ; % CH3
     0    , 0    , 986.5 , 1318  ; % CH2
     156.4, 156.4, 0     , 353.5 ; % OH
     300  , 300  , -229.1, 0    ]; % H2O

%% Calculation of r & q
r = R * N;
q = Q * N;

%% Initializing Vectors
vx=zeros(length(N),1);
Xmix=zeros(size(N,1),1);
XQ=zeros(1,size(N,2));
XQmix=0;
Ctetha=size(N);

%% Calculating Intermediate Parameters
tetha=x.*q/dot(x,q);
phi=x.*r/dot(x,r);
tau=exp(-a./T);

%% Calculating Gama Combinotorial & Residual
for i=1:size(N,1)
    vx(i)=dot(N(i,:),x);
end
X=bsxfun(@rdivide,N,sum(N, 1));
for i=1:size(N,1)
    Xmix(i)=vx(i)/sum(vx);
    XQmix=XQmix+Xmix(i)*Q(i);
    for j=1:size(N,2)
        XQ(1,j)=dot(X(:,j),Q);
        Ctetha(i,j)=X(i,j)*Q(i)/XQ(1,j);
    end
end
Ctethamix=Xmix.*Q'./XQmix;
Ctetha=[Ctetha,Ctethamix];
SCtaopsi=(Ctetha'*tau)';
Ctetha_SCtopsi=Ctetha./SCtaopsi;
Ctethatau_SCtopsi=tau*Ctetha_SCtopsi;
lnactivity=Q'.*(1-log(SCtaopsi)-Ctethatau_SCtopsi);
lnactivity_pure=dot(N,lnactivity(:, 1:end-1));
lnactivity_mix=sum(lnactivity(:,end).*(N));
lngamma_c=diag((log(phi./x)+(1 - phi./x)-5*q.*(log(phi./tetha)+(1 - phi./tetha))));
lngamma_r=lnactivity_mix-lnactivity_pure;

%% Calculating Activity Coeffcients
lngamma=lngamma_c+lngamma_r';
gamma=exp(lngamma);