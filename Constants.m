N=10; %Total Points of dicretitzationN
M=N-1; % Total of Panels
c=1; % Wing Chord in cm
NACA_Profile= 2408; %NACA Profile of for 4 digits
alpha=deg2rad(4); %Atack Angle in degre
U_inf=1; % U stream Velocity m/s

N_field=500;
N_geo_field=max(N)*10;
N_alpha_l0=500;
%% Graphics Constants
Veloscity_Mesh=true;
Plot_NACA=false;
Plot_NACA_points=false;
Plot_CP=false;
Veloscity_Flow=true;
Plot_Veloscity_Flow=true;
Alpha_0=true;