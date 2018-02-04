function [x_vel,z_vel,X_vel,Z_vel,Y_vel] = mesh_Velocity(c,N_field)
p_stream=0.5*c;
% L=c*p_stream;
N_stream=round(0.25*N_field);
% N=round(N_field-N_stream*2);
% for i=1:N_field
%     
% if i<=N_stream
% x(i)=-(N_stream-i)*L/(N_stream-1);
% 
% elseif i>N_stream && (i<=N+N_stream)
% x(i)=(c/2)*(1-cos((i-1-N_stream)*pi/(N-1)));
% 
% elseif (i>N+N_stream) && i<=N_field
% x(i)=(i-1)*L/(N_stream-1)+x(N+N_stream);
% end

x_vel=-p_stream:(c+p_stream*2)/(N_field-1):(p_stream+c);
z_vel=-p_stream:(p_stream*2)/(N_field-1):(p_stream);
[X_vel,Z_vel,Y_vel] = meshgrid(x_vel,z_vel,0:1);
end
