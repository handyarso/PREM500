clear all; close all; clc;
dataPREM = load('PREM500.csv');

MEarth = 5.9742E+24; % dalam Kg
REarth = 6371.00 * 1000; % dalam meter
VEarth = (4/3)*pi*(REarth.^3); % dalam meter kubik
G = 6.6743e-11; % dalam Nm2/Kg2

g0 = (G*MEarth)/(REarth.^2);

rEarth    = dataPREM(:,1); % dalam meter
Vpv       = dataPREM(:,2);
Vsv       = dataPREM(:,3);
Dens      = dataPREM(:,4);

myCoef = myReverse(rEarth, Vpv, Dens)

%myDensity=0.107.*Vpv-0.0535.*Vsv+0.026.*Vpv.*Vsv+0.0463.*(Vpv.^2-1.3333.*(Vsv.^2));
%myDensity=1.92.*(Vpv.^0.186);
VpKm = Vpv/1000;
myDensity = 1.66*VpKm - 0.4721*(VpKm.^2) + 0.0671*(VpKm.^3) - 0.0043*(VpKm.^4) + 0.000106*(VpKm.^5);
plot(rEarth, myDensity); hold on
plot(rEarth, Dens./1000, 'r');
xlabel('Earth Radii (m)','FontSize',12);
ylabel('Density (gr/cc)','FontSize',12);
legend('BROCHER et al','PREM','Location','northeast');
