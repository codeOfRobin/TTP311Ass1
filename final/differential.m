function [ ret ] = differential(t,y,temp,w0,p0,l0)
% ret is in the sequence l,p,p1
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A0=[5.9874e5 ; 1.8942e10 ; 2.8558e9];
E0=[1.988e4 ; 2.3271e4 ; 2.2845];
Ac=[4.3075e7 ; 1.2114e10 ; 1.6377e10];
Ec=[1.8806e4 ; 2.0670 ; 2.0107e4];
enthalpy=[1.918e3 ; -5.9458e3 ; -4.0438e3];
entropy=[-7.8846 ; 9.4374e-1 ; -6.9457];


% % SI ification of everything
% entropy=entropy*4.184;
% enthalpy=enthalpy*4.184;
% Ec=Ec*4.184;
% E0=E0*4.184;

% note-time in hours.
l=y(1);
p=y(2);
p1=y(3);
ret=zeros(3,1);
forRates=zeros(3,1);
backwardRates=zeros(3,1);
constsOfEqbm=zeros(3,1);

for i=1:1:3
	forRates(i)=forwardRates(A0(i),E0(i),temp,Ac(i),Ec(i),p);
	constsOfEqbm(i)=eqbmConst(enthalpy(i),entropy(i),temp);
	backwardRates(i)=forRates(i)/constsOfEqbm(i);
end
w=w0+p0-p;
ret(1)=-forRates(1)*l*w + backwardRates(1)*p1 - forRates(3)*p*l + backwardRates(3)*(p-p1);
ret(2)=forRates(1)*l*w - backwardRates(1)*p1 - forRates(2)*p*p + backwardRates(2)*(l0-l-p)*w;
ret(3)=forRates(1)*l*w - backwardRates(1)*p1 - 2*forRates(2)*p1*p + 2*backwardRates(2)*(p-p1)*w - forRates(3)*p1*l + backwardRates(3)*p1;

end

