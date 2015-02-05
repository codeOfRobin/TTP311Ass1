function [ eqbmConst ] = eqbmConst( enthalpy,entropy,temp )
%This returns the eqbm constant

eqbmConst=exp((entropy./1.9858775)-(enthalpy./(1.9858775.*temp)));


end

