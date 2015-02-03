function [ forwardRates ] = forwardRates(A0,E0,temp,Ac,Ec,COOH)
%calculates forward rates of rxn
    forwardRates=A0.*exp(-E0./(8.314*temp))+Ac.*exp(-Ec./(8.314*temp))*COOH;
end

