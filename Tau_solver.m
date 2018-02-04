function [A,RHS] = Tau_solver( Coord, Vector,U_inf, alpha)
% A and RHS Solver (A*TAU=RHS)

M=length(Vector);
for i=1:M
    nx(i)= Vector(1,i);
    nz(i)= Vector(2,i);
    
    for j=1:M
        
        x0=Coord(1,j); %x_v Vortex at j
        z0=Coord(2,j); %z_v Vortex at j
        
        x=Coord(3,i);  %x_cp at i
        z=Coord(4,i);  %x_cp  at i     

        [u_in,w_in]=induced_velocity(x,z,x0,z0);
        A(i,j)=u_in*nx(i)+w_in*nz(i);
        
    end
    
    RHS(i,:)=-U_inf*(cos(alpha)*nx(i)+sin(alpha)*nz(i));
end


end

