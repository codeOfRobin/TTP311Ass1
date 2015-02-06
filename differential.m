function [ ret ] = differential(t,y,temp,w0,p0,l0, A0,E0,Ac,Ec,enthalpy, entropy)
% ret is in the sequence l,p,p1
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ret=zeros(3,1);
forwardRates=zeros(3,1);
backwardRates=zeros(3,1);
eqbmConsts=zeros(3,1);
R=1.9858775;

l=y(1);
p=y(2);
p1=y(3);

for i=1:1:3
	forwardRates(i)=A0(i)*exp(-E0(i)/(R*temp))+Ac(i)*exp(-Ec(i)/(R*temp))*p;
	eqbmConsts(i)=exp((entropy(i)/R)-(enthalpy(i)/(R*temp)));
	backwardRates(i)=forwardRates(i)/eqbmConsts(i);
end

w=w0+p0-p;
% remember to try replacing l and w with y in case it doesn't work
ret(1)=-forwardRates(1)*l*w + backwardRates(1)*p1 - forwardRates(3)*l*p + backwardRates(3)*(p-p1);
ret(2)=forwardRates(1)*l*w - backwardRates(1)*p1 - forwardRates(2)*p*p + backwardRates(2)*(l0-l-p)*w;
ret(3)=forwardRates(1)*l*w - backwardRates(1)*p1 - 2*forwardRates(2)*p1*p + 2*backwardRates(2)*(p-p1)*w - forwardRates(3)*p1*l + backwardRates(3)*p1;


end

