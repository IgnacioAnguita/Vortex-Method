function [CL] = Coef_l( U_inf,c,TAU)
%This function compute the Cl coeficient per unit span
N=length(TAU);
CL=(2/(U_inf*c))*sum(TAU);
end

