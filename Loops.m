N_v=6:256;

for i=1:length(N_v)
   N=N_v(i);
   Discrete_Vortex;
   Cl_n(i)=Cl;
   Flot_tot_n(i)=Flow_tot;
end

%% Graphics Constants
Plot_Cl=true;
Plot_Flow=true;

if (Plot_Cl==true)
plot(N_v,Cl_n); hold on;grid on; xlim([min(N_v) max(N_v)]); ylim([min(Cl_n) max(Cl_n)]); xlabel('N panels');ylabel('Cl')
title(['Cl Convergence Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Cl");grid on; hold off;
end

if (Plot_Flow==true)
plot(N_v,Flot_tot_n); hold on;grid on; xlim([min(N_v) max(N_v)]); ylim([min(Flot_tot_n) max(Flot_tot_n)]); xlabel('N panels');ylabel('Percent Flow Trough')
title(['Flow trough Airfoil Profile: NACA ' num2str(NACA_Profile)]);legend("Percent Flow Trough");grid on; hold off;
end