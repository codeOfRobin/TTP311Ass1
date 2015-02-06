A0=[5.9874e5 ; 1.8942e10 ; 2.8558e9];
E0=[1.988e4 ; 2.3271e4 ; 2.2845e4];
Ac=[4.3075e7 ; 1.2114e10 ; 1.6377e10];
Ec=[1.8806e4 ; 2.0670e4 ; 2.0107e4];
enthalpy=[1.918e3 ; -5.9458e3 ; -4.0438e3];
entropy=[-7.8846 ; 9.4374e-1 ; -6.9457];


x = linspace(0,10);
y1 = sin(x);
y2 = sin(2*x);
y3 = sin(4*x);
y4 = sin(8*x);

[myT myY]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],513,0.55555,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);
[myT2 myY2]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],523,0.55555,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);
[myT3 myY3]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],533,0.5555,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);

figure('name','Effect of temperature')

subplot(3,1,1)
plot(myY(:,1),myT,myY2(:,1),myT2,myY3(:,1),myT3);
title('plot of l at 3 different temperatures')
legend('240 degrees','250 degrees','260 degrees')
xlabel('time')
ylabel('concentration of caprolactam')

subplot(3,1,2)
plot(myY(:,2),myT,myY2(:,2),myT2,myY3(:,2),myT3);
title('plot of p at 3 different temperatures')
legend('240 degrees','250 degrees','260 degrees')
xlabel('time')
ylabel('concentration of polymers')

subplot(3,1,3)
plot(myY(:,3),myT,myY2(:,3),myT2,myY3(:,3),myT3);
title('plot of p1 at 3 different temperatures')
legend('240 degrees','250 degrees','260 degrees')
xlabel('time')
ylabel('concentration of single length monomer')

[myT myY]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],533,0,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);
[myT2 myY2]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],533,0.05555,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);
[myT3 myY3]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],533,0.5555,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);
[myT4 myY4]=ode45(@differential,[0 24],[8.837,0.1,0.1],[],533,2.7777,0.1,8.837,A0,E0,Ac,Ec,enthalpy,entropy);

figure('name','Effect of water concentration')
subplot(3,1,1)
plot(myY(:,1),myT,myY2(:,1),myT2,myY3(:,1),myT3,myY4(:,2),myT4);
title('plot of l at 3 different water concentrations')
legend('0% wt','0.1% wt','1% wt','5% wt');
xlabel('time')
ylabel('concentration of caprolactam')

subplot(3,1,2)
plot(myY(:,2),myT,myY2(:,2),myT2,myY3(:,2),myT3,myY4(:,2),myT4);
title('plot of p at 3 different water concentrations')
legend('0% wt','0.1% wt','1% wt','5% wt');
xlabel('time')
ylabel('concentration of caprolactam')

subplot(3,1,3)
plot(myY(:,3),myT,myY2(:,3),myT2,myY3(:,3),myT3,myY4(:,3),myT4);
title('plot of p1 at 3 different water concentrations')
legend('0% wt','0.1% wt','1% wt','5% wt');
xlabel('time')
ylabel('concentration of caprolactam')
