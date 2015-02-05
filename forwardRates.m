function [ forwardRates ] = forwardRates(A0,E0,temp,Ac,Ec,COOH)
%calculates forward rates of rxn
%ideally, put A0, E0 one by one. Still works with matrices tho
    forwardRates=A0.*exp(-E0./(8.314*temp))+Ac.*exp(-Ec./(8.314*temp))*COOH;
end

