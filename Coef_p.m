function [CP] = Coef_p( U_inf,C,TAU)
%This function compute the Cl coeficient per unit span
Tau=TAU';
CP=(2./(U_inf*C)).*Tau;
end

