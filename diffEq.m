
tRange = [0,10];              % set up range for t
yZero = [0.2,1.1];            % and an initial condition
[myT,myY]=ode45(@lvRHS,tRange,yZero);
plot(myT,myY(:,1),'c');
hold on
plot(myT,myY(:,2));
legend('prey','predator');
xlabel('t');
ylabel('population densities');