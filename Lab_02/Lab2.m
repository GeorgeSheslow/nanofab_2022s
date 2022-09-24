clear
clf
clc
close all

Beam_Energy = [1 10 20 25 30];
Num_of_Electrons = 100000;

Pt_Depth = [11.6 249 512 682 1336];

Pt_Backscatter =[0.40396 0.44 0.4622 0.47186 0.47734];

Mg_Depth = [53 2078 6700 10591 14500];

Mg_Backscatter = [0.165 0.0981 0.1131 0.1117 0.1118];

figure(1)
subplot(1,2,1)
plot(Beam_Energy, Pt_Depth,'linewidth',4)
hold on 
plot(Beam_Energy, Mg_Depth,'linewidth',4)
hold off
title("Peneration Depth vs Beam Energy",'FontSize',14)
legend("Platinum","Magnesium",'Location','NorthWest','FontSize',14)
xlabel("Beam Energy (keV)",'FontSize',14);
ylabel("Penetration Depth (nm)",'FontSize',14);
subplot(1,2,2)
plot(Beam_Energy, Pt_Backscatter,'linewidth',4)
hold on
plot(Beam_Energy, Mg_Backscatter,'linewidth',4)
title("Backscattered Energy vs Beam Energy",'FontSize',14)
legend("Platinum","Magnesium",'Location','NorthWest','FontSize',14)
xlabel("Beam Energy (keV)",'FontSize',14);
ylabel("Backscattered Energy Yield (Backscattered Co-efficient)",'FontSize',14);

%%

% Import data from .dat files
Energy_10 = Mg10kV.EnergyKeV;
Hits_10 = Mg10kV.HitsNormalized;

Energy_30 = Mg30kV.EnergyKeV;
Hits_30 = Mg30kV.HitsNormalized;

figure(1)

plot(Energy_10, Hits_10);
hold on
plot(Energy_30, Hits_30);

title('Magnesium Backscattered Energy vs Beam Energy at 10keV and 30keV','FontSize',14);
xlabel('Beam Energy (keV)','FontSize',14);
ylabel('Backscattered Energy Normalised','FontSize',14)
legend('30keV','10keV','FontSize',14);
