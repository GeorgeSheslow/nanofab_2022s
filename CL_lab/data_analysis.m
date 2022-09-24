close all
clear all
clc

load CL_data.mat
% figure(1)
% for i = 1:30
%     x = CLdata{:,i+1};
%     y = CLdata.E;
%     
%     plot(y,x)
%     hold on
% end
% hold off
% 
% figure(2)
% for i = 1:30
%     z = CLdata{:,i+1};
%     x = CLdata.E;
%     num = size(z);
%     y = repelem(i,num(1,1));
% 
%     plot3(x,y,z)
%     hold on
% end
% hold off

figure(1)

for i = 1:30
    z = CLdata{:,i+1};
    x = CLdata.E;
    num = size(z);
    y = repelem(i,num(1,1));

    x_plot(:,i) = x';
    y_plot(:,i) = y;
    z_plot(:,i) = z';
    c_plot(:,i) = repelem(i,num(1,1));

end
s = surf(x_plot,y_plot,z_plot,c_plot,'FaceAlpha',0.4);
s.EdgeColor = 'none';
hold on
xlabel('Energy (eV)')
ylabel('Beam Energy (keV)');
zlabel('Energy');
title('CL Spectra');

%% Peak Finding
% mask = imregionalmax(z_plot);
% hold on
% plot3(x_plot(mask), y_plot(mask), z_plot(mask), 'r+')

%%
figure(2)
energy = 1:30;
% 2.2 eV
peak_1 = [9.20728000000000e-07,1.47024000000000e-06,1.96258000000000e-06,2.59605000000000e-06,3.24079000000000e-06,3.77703000000000e-06,4.12265000000000e-06,5.53034000000000e-06,3.48510000000000e-05,0.00324826700000000,0.124374821000000,1.50587330900000,8.67432614600000,30.7006992600000,78.1759711400000,158.380255900000,272.648752800000,416.866009400000,583.580644400000,764.226697000000,950.662611400000,1135.98879900000,1314.82469100000,1483.24398800000,1638.58488900000,1779.20254400000,1904.23794600000,2013.42330600000,2106.91762600000,2185.19153400000];
% subplot(5,1,1);
plot(energy,peak_1);
hold on;
% 2.5 eV
peak_2 = [80.0091910100000,135.368167600000,205.860136700000,325.028223600000,503.128025400000,763.175894100000,1150.32020900000,1706.87761000000,2388.83646300000,3047.99021700000,3535.95143700000,3788.83431100000,3825.13028800000,3703.87171100000,3488.81921200000,3230.88937200000,2964.19869100000,2708.62900300000,2474.03285700000,2264.02226900000,2078.66471500000,1916.23697500000,1774.26929600000,1650.10980700000,1541.22503800000,1445.32879100000,1360.42548000000,1284.80958400000,1217.03836700000,1155.90625300000];
% subplot(5,1,2);
plot(energy,peak_2);
% 2.635 eV
peak_3 = [15.4889613100000,24.7323865100000,33.0118776100000,43.6620641000000,54.4957338600000,63.4947633900000,68.9637654100000,70.1012982800000,71.7640749100000,93.4825903300000,171.785435900000,344.608670300000,620.425357800000,963.255748800000,1312.35244300000,1613.50358800000,1836.26055600000,1973.81705700000,2034.97228200000,2035.31239500000,1991.56048900000,1918.49017400000,1827.73359100000,1727.97138900000,1625.24858900000,1523.59122800000,1425.53813700000,1332.54929100000,1245.41475800000,1164.37863700000];
% subplot(5,1,3);
plot(energy,peak_3);
% 2.8 eV
peak_4 = [60.4229555200000,96.4818166800000,128.780208500000,170.326526200000,212.588242600000,247.692361200000,269.005115100000,272.007268700000,259.071385900000,239.806109200000,223.088768900000,211.446125900000,202.737079400000,194.166151300000,184.287593400000,172.981562000000,160.783650300000,148.358620500000,136.245003600000,124.801420600000,114.219997000000,104.573296400000,95.8607356500000,88.0341026900000,81.0240474600000,74.7524563900000,69.1406064300000,64.1144593600000,59.6043345800000,55.5498157800000];
% subplot(5,1,4);
plot(energy,peak_4);
% 3.385 eV
peak_5 = [745.680883600000,1190.68399900000,1589.27908800000,2102.00301300000,2623.55568700000,3056.77630700000,3319.79743300000,3356.84777600000,3197.21538600000,2959.52266600000,2753.70414300000,2613.87271000000,2523.81044300000,2466.68418900000,2441.10490500000,2451.72942900000,2499.20741200000,2578.13457000000,2679.48315600000,2793.99957400000,2913.95726700000,3033.88922400000,3150.58795400000,3262.45759200000,3369.12872300000,3470.95798700000,3568.68914800000,3663.24776500000,3755.51408500000,3846.34620800000];
% subplot(5,1,5);
plot(energy,peak_5);

legend('YL (2.2eV)','QW2 (2.5eV)','QW1 (2.635eV)','BL (2.8eV)','NBE (3.385eV)','Location', 'NorthWest');
title('Depth Profile')


%% Guassian Curve Fitting

e = [1:0.1:30];

%QW2
f = fit(energy',peak_2','gauss8')
Qw2_fit = f(e)
plot(e,Qw2_fit)
QW2_e = max(Qw2_fit)

%QW1
f = fit(energy',peak_3','gauss8')
Qw1_fit = f(e)
plot(e,Qw1_fit)
QW1_e = max(Qw1_fit)


%% QW Depth Calculations
A = 83.73;
Z = 38;
p = 6.15;

%QW2
E0 = 12.6;
QW2_Re = ((27.6*A*E0^(5/3))/(Z^(8/9)*p))/1000

%QW1
E0 = 19.6;
QW1_Re = ((27.6*A*E0^(5/3))/(Z^(8/9)*p))/1000