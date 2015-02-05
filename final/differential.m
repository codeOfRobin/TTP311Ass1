function [ ret ] = differential(t,y,temp,w0,p0,l0, A0,E0,Ac,Ec,enthalpy, entropy)
% ret is in the sequence l,p,y(3)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ret=zeros(3,1);
forwardRates=zeros(3,1);
backwardRates=zeros(3,1);
R=1.9858775;



for i=1:1:3
	forwardRates(i)=A0(i)*exp(-E0(i)/(R*temp))+Ac(i)*exp(-Ec(i)/(R*temp))*y(2);
	eqbmConsts(i)=exp((entropy(i)/R)-(enthalpy(i)/(R*temp)));
	backwardRates(i)=forwardRates(i)/eqbmConsts(i);
end

w=w0+p0-y(2);
% remember to try replacing l and w with y in case it doesn't work
ret(1)=-forwardRates(1)*y(1)*w + backwardRates(1)*y(3) - forwardRates(3)*y(1)*y(2) + backwardRates(3)*(y(2)-y(3));
ret(2)=forwardRates(1)*y(1)*w - backwardRates(1)*y(3) - forwardRates(2)*y(2)*y(2) + backwardRates(2)*(l0-y(1)-y(2))*w;
ret(3)=forwardRates(1)*y(1)*w - backwardRates(1)*y(3) - 2*forwardRates(2)*y(3)*y(2) + 2*backwardRates(2)*(y(2)-y(3))*w - forwardRates(3)*y(3)*y(1) + backwardRates(3)*y(3);


end

