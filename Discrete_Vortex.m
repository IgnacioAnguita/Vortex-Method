%clear all;
clearvars -except N N_v Cl_n Flot_tot_n i;
Constants;

%% GEOMETRY Discretitzation

x=full_cosine(c,N);

[z,Z_geo_up,Z_geo_low] =NACA_4digit( NACA_Profile,x);

if (Plot_NACA==true)
plot(x/c,z/c); hold on;plot(x/c,Z_geo_up/c);plot(x/c,Z_geo_low/c); grid on; xlim([min(x/c) max(x/c)]); ylim([-max(x/c)/4 max(x/c)/4]); xlabel('x/c');ylabel('z/c')
title(['Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Camber Line", "Geometric Airfoil Upper", "Geometric Airfoil Lower");grid on; hold off;
end

% figure;hold on;
% for i=1:length(X_vel(:,1))
% scatter(X_vel(i,:),Z_vel(i,:),15,'b','filled');
% end
% xlim([min(x_vel) max(x_vel)]); hold off;


%   Coord_XZ(1,:): x_j Panel
%   Coord_XZ(2,:): z_j Panel

%   Coord(1,:): x_v Vortex
%   Coord(2,:): z_v Vortex

%   Coord(3,:): x_cp Control Point
%   Coord(4,:): z_cp Control Point

%   Coord(5,:): C Chord distance

%   Vector(1,:): n_x Normal Vector x
%   Vector(2,:): n_z Normal Vector z

%   Vector(3,:): t_x Tangent Vector x
%   Vector(4,:): t_z Tangent Vector z

%   Points(1,:)=P0_x;
%   Points(2,:)=P0_y;
%   Points(3,:)=N_P1_x;
%   Points(4,:)=N_P1_y;
%   Points(5,:)=T_P1_x;
%   Points(6,:)=T_P1_y;

[Coord_XZ, Coord,Vector, Points] = Geometry(x,z);

if (Plot_NACA_points==true)
figure;
plot(x,z);hold on; scatter(x,z,15,'b','filled');scatter(Coord(1,:),Coord(2,:),15,'r','filled');scatter(Coord(3,:),Coord(4,:),15,'g','filled');
for i=1:N-1
    sx=0.4;
p0=[Points(1,i) Points(2,i)];
n_p1=[Points(3,i) Points(4,i)]; 
t_p1=[Points(5,i) Points(6,i)];
    
draw_arrow(p0,n_p1,0.6);draw_arrow(p0,t_p1,0.1);
end
grid on; xlim([min(x) max(x)]); ylim([-max(x)/10 max(x)/10]); xlabel('x');ylabel('z')
title(['Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Camber Line", "Panel Points", "Vortex Points", "Control Points");grid on; hold off;
end

%% LINEAR SOLVER

[A,RHS] = Tau_solver( Coord, Vector, U_inf, alpha);

TAU = linsolve(A,RHS); % Solver of Matrix A*TAU=RHS

Cl = Coef_l( U_inf,c,TAU);
Cm_ref = Coef_m(TAU,Coord(1,:), 0.25*c,U_inf,c,alpha);
Cp=Coef_p( U_inf, Coord(5,:),TAU);

if (Plot_CP==true)
figure;
plot(Coord(1,:),Cp); hold on;grid on; xlim([min(Coord(1,:)) max(Coord(1,:))]); ylim([min(Cp) max(Cp)]); xlabel('x [m]');ylabel('Cp')
title(['Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Pressure Coeficient");grid on; hold off;
end

%% Velocity Mesh
if (Veloscity_Mesh==true)
[x_vel,z_vel,X_vel,Z_vel,Y_vel]=mesh_Velocity(c,N_field);
[U_vel,W_vel,V_vel] = Velocity_field(X_vel,Z_vel,Y_vel,Coord(1,:),Coord(2,:),TAU,U_inf,alpha);

%   Coord(1,:): X_v Vortex
%   Coord(2,:): Z_v Vortex

figure;
plot(x,z);hold on; scatter(Coord(1,:),Coord(2,:),15,'b','filled');
streamslice(X_vel,Z_vel,Y_vel,U_vel,W_vel,V_vel,[],[],[1]); plot(x/c,Z_geo_up/c,'r');plot(x/c,Z_geo_low/c,'r');
grid on; xlim([min(min(min(X_vel))) max(max(max(X_vel)))]); ylim([min(min(min(Z_vel))) max(max(max(Z_vel)))]); xlabel('x');ylabel('z')
title(['Stream-line Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Camber Line", "Vortex Points","Stream Lines");hold off;
end


%% Flux going through Chord
if (Veloscity_Flow==true)
X_flow=full_cosine(c,N_geo_field);
[Z_flow] =NACA_4digit( NACA_Profile,X_flow);
[Coord_flow,Vector_flow] = Geometry_velocity(X_flow,Z_flow);
[Flow] = Flow_velocity(Coord_flow(1,:),Coord_flow(2,:),X_flow,Z_flow,Vector_flow(1,:),Vector_flow(2,:),Coord_flow(3,:),TAU,U_inf,alpha);
Flow_tot=mean(Flow);
Flow_tot_v=Flow_tot*ones(1,length(Flow));
if (Plot_Veloscity_Flow==true)
figure;
plot(X_flow(1:length(Flow)),Flow);hold on; plot(X_flow(1:length(Flow)),Flow_tot_v);grid on; xlim([min(X_flow) max(X_flow)]); ylim([min(Flow) max(Flow)]); xlabel('x');ylabel('Flow Percent (100%)')
title(['Flow Through Airfoil Camber Line Profile: NACA ' num2str(NACA_Profile)]);legend("Flow Percent","Mean Flow Percent");hold off;
end
end

%% Calculation of Alpha 0
if (Alpha_0==true)
X_alpha=full_cosine(c,N_alpha_l0);
[Z_alpha] =NACA_4digit( NACA_Profile,X_alpha);
[Alpha_l0] = alpha_l0(X_alpha,Z_alpha);
end
