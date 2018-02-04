function [Alpha_l0,theta] = alpha_l0(x,z)
X = fliplr(x);
Z= fliplr(z);
c=max(X);
[theta,rho] = cart2pol(X-(c/2),Z);

for i=1:length(X)-1
Delta_z=z(i+1)-z(i);
Delta_x=x(i+1)-x(i);
%Delta_Theta(i)=theta(i+1)-theta(i);
Slopes=Delta_z/Delta_x;
Function(i)=Slopes*(cos(theta(i))-1);

end
Alpha_l0=-trapz(theta(1:length(Function)),Function)/pi;


end

