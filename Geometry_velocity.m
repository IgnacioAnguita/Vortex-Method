function [Coord,Vector] = Geometry_velocity(x,z)
%This Function returns the Vector components of the Normal adn Tangent,
%and their points.

N=length(x);
for i=1:N-1
Delta_X(i)=x(i+1)-x(i);
Delta_Z(i)=z(i+1)-z(i);

C(i)=((Delta_X(i))^2+(Delta_Z(i)^2))^0.5;

Nx(i)=-Delta_Z(i)/C(i);
Nz(i)=Delta_X(i)/C(i);

Tx(i)=Delta_X(i)/C(i);
Tz(i)=Delta_Z(i)/C(i);

X_v(i)=x(i)+C(i)*Tx(i)*(1/4);
Z_v(i)=z(i)+C(i)*Tz(i)*(1/4);


end

Coord(1,:)=X_v;
Coord(2,:)=Z_v;
Coord(3,:)=C;

Vector(1,:)=Nx;
Vector(2,:)=Nz;

end