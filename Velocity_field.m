function [U_vel,W_vel,V_vel] = Velocity_field(X_vel,Z_vel,Y_vel,X_v,Z_v,TAU,U_inf,alpha)
for i=1:length(X_vel)
    for k=1:length(Z_vel)
    [U_tot, W_tot] = Velocity_Vortex(X_vel(i,k,1),Z_vel(i,k,1),X_v,Z_v,TAU);
    W_vel(i,k,1)=U_inf*sin(alpha)+W_tot;
    U_vel(i,k,1)=U_inf*cos(alpha)+U_tot;
    end
end
V_vel=Y_vel.*0;
W_vel=W_vel+Y_vel.*0;
U_vel=U_vel+Y_vel.*0;
end
