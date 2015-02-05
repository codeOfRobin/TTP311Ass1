function [ ret ] = diffEq(t,y,w0,p0,l0)
%solves the differential equations for the ring opening, polycondensation
%and polyaddition
A0=[5.9874e5 ; 1.8942e10 ; 2.8558e9];
E0=[1.988e4 ; 2.3271e4 ; 2.2845];
Ac=[4.3075e7 ; 1.2114e10 ; 1.6377e10];
Ec=[1.8806e4 ; 2.0670 ; 2.0107e4];
enthalpy=[1.918e3 ; -5.9458e3 ; -4.0438e3];
entropy=[-7.8846 ; 9.4374e-1 ; -6.9457];
    
% SI ification of everything
entropy=entropy*4.184;
enthalpy=enthalpy*4.184;
Ec=Ec*4.184;
E0=E0*4.184;

ret=zeros(3,1);
backRates=zeros(3,1);
forRates=zeros(3,1);

p1=y(1);
p=y(2);
l=y(3);

w=w0+p0-p;

% note-time in hours.
forRates=forwardRates(A0,E0,413,Ac,Ec,p);
constsOfEqbm=eqbmConst(enthalpy,entropy,[513; 513 ; 513]);
backRates=constsOfEqbm./forRates;

ret(1) = forRates(1)*l*w - backRates(1)*p1 - 2*forRates(2)*p1*p + 2*backRates(2)*(p-p1)*w - 2*forRates(2)*p1*l +backRates(3)*p1;
% assumption p1=p2
ret(2) = forRates(1)*l*w - backRates(1)*p1 - forRates(2)*p*p + backRates(2)*((l0 - l)-p)*w;
ret(3) = -forRates(1)*l*w + backRates(1)*p1 -forRates(3)*p*l +backRates(3)*(p-p1);

 
end

