function [ rates ] = forwardRates( A0,E0,temp,Ac,Ec,COOH )
%returns forward rates
%ideally, put A0, E0 one by one. Still works with matrices tho

rates=A0.*exp(-E0./(8.314*temp))+Ac.*exp(-Ec./(8.314*temp))*COOH;

end

