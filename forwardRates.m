function [ forwardRates ] = forwardRates(A0,E0,temp,Ac,Ec,COOH)
%calculates forward rates of rxn
%ideally, put A0, E0 one by one. Still works with matrices tho
    forwardRates=A0.*exp(-E0./(1.9858775*temp))+Ac.*exp(-Ec./(1.9858775*temp))*COOH;
end

