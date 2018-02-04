function [Cm_ref ] = Coef_m(TAU,x, x_ref, U_inf, c, alpha)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
M=length(TAU);
Delta_x=x'-x_ref;
Tau=TAU';
Cm_ref=-(2/(U_inf*(c^2)))*Tau*Delta_x*cos(alpha);

end

