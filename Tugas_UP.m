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
