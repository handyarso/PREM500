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

for aa=1:length(rEarth)
  if (rEarth(aa,1) <= myCoef(1,5))
    myDensity2(aa,1) = myCoef(1,1)*rEarth(aa,1)^2 + myCoef(1,2)*rEarth(aa,1) + myCoef(1,3);

  elseif (rEarth(aa,1) > myCoef(1,5)) && (rEarth(aa,1) <= myCoef(2,5))
    myDensity2(aa,1) = myCoef(2,1)*rEarth(aa,1)^2 + myCoef(2,2)*rEarth(aa,1) + myCoef(2,3);

  elseif (rEarth(aa,1) > myCoef(2,5)) && (rEarth(aa,1) <= myCoef(3,5))
    myDensity2(aa,1) = myCoef(3,1)*rEarth(aa,1)^2 + myCoef(3,2)*rEarth(aa,1) + myCoef(3,3);

  elseif (rEarth(aa,1) > myCoef(3,5)) && (rEarth(aa,1) <= myCoef(4,5))
    myDensity2(aa,1) = myCoef(4,1)*rEarth(aa,1)^2 + myCoef(4,2)*rEarth(aa,1) + myCoef(4,3);

  elseif (rEarth(aa,1) > myCoef(4,5)) && (rEarth(aa,1) <= myCoef(5,5))
    myDensity2(aa,1) = myCoef(5,1)*rEarth(aa,1)^2 + myCoef(5,2)*rEarth(aa,1) + myCoef(5,3);

  elseif (rEarth(aa,1) > myCoef(5,5)) && (rEarth(aa,1) <= myCoef(6,5))
    myDensity2(aa,1) = myCoef(6,1)*rEarth(aa,1)^2 + myCoef(6,2)*rEarth(aa,1) + myCoef(6,3);

  elseif (rEarth(aa,1) > myCoef(6,5)) && (rEarth(aa,1) <= myCoef(7,5))
    myDensity2(aa,1) = myCoef(7,1)*rEarth(aa,1)^2 + myCoef(7,2)*rEarth(aa,1) + myCoef(7,3);

  elseif (rEarth(aa,1) > myCoef(7,5)) && (rEarth(aa,1) <= myCoef(8,5))
    myDensity2(aa,1) = myCoef(8,1)*rEarth(aa,1)^2 + myCoef(8,2)*rEarth(aa,1) + myCoef(8,3);

  elseif (rEarth(aa,1) > myCoef(8,5)) && (rEarth(aa,1) <= myCoef(9,5))
    myDensity2(aa,1) = myCoef(9,1)*rEarth(aa,1)^2 + myCoef(9,2)*rEarth(aa,1) + myCoef(9,3);

  elseif (rEarth(aa,1) > myCoef(9,5)) && (rEarth(aa,1) <= myCoef(10,5))
    myDensity2(aa,1) = myCoef(10,1)*rEarth(aa,1)^2 + myCoef(10,2)*rEarth(aa,1) + myCoef(10,3);

  elseif (rEarth(aa,1) > myCoef(10,5)) && (rEarth(aa,1) <= myCoef(11,5))
    myDensity2(aa,1) = myCoef(11,1)*rEarth(aa,1)^2 + myCoef(11,2)*rEarth(aa,1) + myCoef(11,3);

  elseif (rEarth(aa,1) > myCoef(11,5)) && (rEarth(aa,1) <= myCoef(12,5))
    myDensity2(aa,1) = myCoef(12,1)*rEarth(aa,1)^2 + myCoef(12,2)*rEarth(aa,1) + myCoef(12,3);
    break;
  else
    disp("out of range");
    break;
  endif
  aa = aa + 1;
end

plot(rEarth(1:length(myDensity2)-3),myDensity2(1:length(myDensity2)-3)./1000,'k.'); hold on
plot(rEarth(1:length(myDensity2)-3), myDensity(1:length(myDensity2)-3));
plot(rEarth(1:length(myDensity2)-3), Dens(1:length(myDensity2)-3)./1000, 'r');
xlabel('Earth Radii (m)','FontSize',12);
ylabel('Density (gr/cc)','FontSize',12);
legend('Koef Polynomial','BROCHER et al','PREM','Location','northeast');
