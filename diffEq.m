tRange = [0,200];              % set up range for t
yZero = [5,0];            % and an initial condition
[myT,myY]=ode45(@lvRHS,tRange,yZero);
plot(myT,myY(:,1),'c');
hold on
plot(myT,myY(:,2));
legend('Substrate','complex');
xlabel('t');
ylabel('population densities');