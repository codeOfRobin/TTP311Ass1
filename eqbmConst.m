function [ eqbmConst ] = eqbmConst( enthalpy,entropy,temp )
%This returns the eqbm constant

eqbmConst=exp((entropy./8.314)-(enthalpy./(8.314.*temp)));


end

