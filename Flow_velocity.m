function [Flow_per] = Flow_velocity(X_v,Z_v,X_flow,Z_flow,Nx,Nz,C,TAU,U_inf,alpha)

for i=1:length(X_v)
[U_tot, W_tot] = Velocity_Vortex(X_flow(i),Z_flow(i),X_v,Z_v,TAU);
    W_flow(i)=U_inf*sin(alpha)+W_tot;
    U_flow(i)=U_inf*cos(alpha)+U_tot;
    
    Flow(i)=(Nx(i)*U_flow(i)+Nz(i)*W_flow(i))*C(i);
end
Flow_tot=U_inf*sin(alpha)*sum(C(1:length(X_flow)-1 ));
Flow_per=100*abs(Flow)/Flow_tot;

end

