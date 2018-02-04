function [Coord_XZ,Coord,Vector, Points] = Geometry(x,z)
%This Function returns the Vector components of the Normal adn Tangent,
%and their points.
P_stream=0.25;

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

X_cp(i)=x(i)+C(i)*Tx(i)*(3/4);
Z_cp(i)=z(i)+C(i)*Tz(i)*(3/4);

P0_x(i)=X_cp(i);
P0_z(i)=Z_cp(i);
N_P1_x(i)=X_cp(i)+Nx(i)/75;
N_P1_z(i)=Z_cp(i)+Nz(i)/75;
T_P1_x(i)=X_cp(i)+Tx(i)/10;
T_P1_z(i)=Z_cp(i)+Tz(i)/10;

end
Coord_XZ(1,:)=x;
Coord_XZ(2,:)=z;

Coord(1,:)=X_v;
Coord(2,:)=Z_v;
Coord(3,:)=X_cp;
Coord(4,:)=Z_cp;
Coord(5,:)=C;

Vector(1,:)=Nx;
Vector(2,:)=Nz;
Vector(3,:)=Tx;
Vector(4,:)=Tz;

Points(1,:)=P0_x;
Points(2,:)=P0_z;
Points(3,:)=N_P1_x;
Points(4,:)=N_P1_z;
Points(5,:)=T_P1_x;
Points(6,:)=T_P1_z;
end