function [u_in,w_in] = induced_velocity(x,z,x0,z0)
%This function calculates the induced velocities

r2=(x-x0).^2+(z-z0).^2;

u_in=(z-z0)./(2*pi.*r2);
w_in=-(x-x0)./(2*pi.*r2);

end

