function [U_tot, W_tot] = Velocity_Vortex(x,z,X_v,Z_v,TAU)
%This function calculates the induced velocities of all the Vortex

%x,z, -> Velocity evaluated
%x0,z0 -> X vortex

N=length(TAU);

for i=1:N
   [u_in,w_in]=induced_velocity(x,z,X_v(i),Z_v(i));
    U_Ind(i)=TAU(i)*u_in;
    W_Ind(i)=TAU(i)*w_in;

end
U_tot=U_Ind*ones(N,1);
W_tot=W_Ind*ones(N,1);
end

