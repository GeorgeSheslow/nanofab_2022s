clear all
close all
clc

set(gca,'FontSize',18)

energies = [2 8 16 30];
line_width = 2.5;


figure(1)
for i = 1:size(energies,2)
    data = load(['O_',num2str(energies(i)),'kev.mat']);
    plot(data.kevoxy.kev,data.kevoxy.O,'LineWidth',line_width);
    hold on;
end
annotate_graph('Implanted Oxygen atoms vs Depth',1);
exportgraphics(gca,'Oxy_1.jpg')

figure(2)
for i = 1:size(energies,2)
    data = load(['O_',num2str(energies(i)),'kev.mat']);
    plot(data.kevoxy.kev,data.kevoxy.C,'LineWidth',line_width);
    hold on;
end
annotate_graph('Vacancies vs Depth for Oxygen Ion Beam',2);
exportgraphics(gca,'Oxy_2.jpg')

figure(3)
for i = 1:size(energies,2)
    data = load(['Ga_',num2str(energies(i)),'kev.mat']);
    plot(data.kevga.kev,data.kevga.Ga,'LineWidth',line_width);
    hold on;
end
annotate_graph('Implanted Gallium atoms vs Depth',1);
exportgraphics(gca,'Ga_1.jpg')

figure(4)
for i = 1:size(energies,2)
    data = load(['Ga_',num2str(energies(i)),'kev.mat']);
    plot(data.kevga.kev,data.kevga.C,'LineWidth',line_width);
    hold on;
end
annotate_graph('Vacancies vs Depth for Gallium Ion Beam',2);
exportgraphics(gca,'Ga_2.jpg')

function annotate_graph(name,ver)
title(name);
xlabel('Depth (nm)');
if ver == 1
    ylabel('Implanted Atoms');
elseif ver == 2
    ylabel('Vacancies');
end

legend('2keV','8keV','16keV','30keV');
hold off;
end
