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

% note-time in hours.
forRates=forwardRates(A0,E0,413,Ac,Ec,24);
constsOfEqbm=eqbmConst(enthalpy,entropy,[513; 513 ; 513]);
backwardRates=constsOfEqbm./forRates;


