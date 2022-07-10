% 10Week 경계면 반사손실
%% 실습 1
% Bottom Reflection Loss
% p. 12
p1 = 1.0; %sea water density
c1 = 1500; %sea water sound speed
seta1 = 0 : 0.1 : 90;

%silt
silt_p2 = 1.7;
silt_c2 = 1575;
seta2 = acos(silt_c2./c1.*cos(deg2rad(seta1)));
silt_reflection_coefficient = abs((silt_p2*silt_c2*sin(deg2rad(seta1))-p1*c1*sin(seta2))./(silt_p2*silt_c2*sin(deg2rad(seta1))+p1*c1*sin(seta2)));
silt_reflection_loss = -20*log10(abs(silt_reflection_coefficient));

%sand
sand_p2 = 1.9;
sand_c2 = 1650;
seta2 = acos(sand_c2./c1.*cos(deg2rad(seta1)));
sand_reflection_coefficient = abs((sand_p2*sand_c2*sin(deg2rad(seta1))-p1*c1*sin(seta2))./(sand_p2*sand_c2*sin(deg2rad(seta1))+p1*c1*sin(seta2)));
sand_reflection_loss = -20*log10(abs(sand_reflection_coefficient));

%gravel
gravel_p2 = 2.4;
gravel_c2 = 1800;
seta2 = acos(gravel_c2./c1.*cos(deg2rad(seta1)));
gravel_reflection_coefficient = abs((gravel_p2*gravel_c2*sin(deg2rad(seta1))-p1*c1*sin(seta2))./(gravel_p2*gravel_c2*sin(deg2rad(seta1))+p1*c1*sin(seta2)));
gravel_reflection_loss = -20*log10(abs(gravel_reflection_coefficient));

%limestone
limestone_p2 = 2.4;
limestone_c2 = 3000;
seta2 = acos(limestone_c2./c1.*cos(deg2rad(seta1)));
limestone_reflection_coefficient = abs((limestone_p2*limestone_c2*sin(deg2rad(seta1))-p1*c1*sin(seta2))./(limestone_p2*limestone_c2*sin(deg2rad(seta1))+p1*c1*sin(seta2)));
limestone_reflection_loss = -20*log10(abs(limestone_reflection_coefficient));


figure;

subplot(1, 2, 1)
plot(seta1, silt_reflection_coefficient, '-b', 'Linewidth', 2)
hold on
plot(seta1, sand_reflection_coefficient, '-r', 'Linewidth', 2)
hold on
plot(seta1, gravel_reflection_coefficient, '-k', 'Linewidth', 2)
hold on
plot(seta1, limestone_reflection_coefficient, '-m', 'Linewidth', 2)
legend('Silt', 'Sand', 'Gravel', 'LimeStone', 'location', 'northeast');
xlabel('grazing angle(deg)', 'fontweight', 'bold');
ylabel('Reflection Coefficient', 'fontweight', 'bold');
title('Reflection coefficient', 'fontweight', 'bold');
grid on
axis([0 90 0 1])

subplot(1, 2, 2)
plot(seta1, silt_reflection_loss, '-b', 'Linewidth', 2)
hold on
plot(seta1, sand_reflection_loss, '-r', 'Linewidth', 2)
hold on
plot(seta1, gravel_reflection_loss, '-k', 'Linewidth', 2)
hold on
plot(seta1, limestone_reflection_loss, '-m', 'Linewidth', 2)
legend('Silt', 'Sand', 'Gravel', 'LimeStone', 'location', 'northwest');
xlabel('grazing angle(deg)', 'fontweight', 'bold');
ylabel('Reflection loss (dB)', 'fontweight', 'bold');
title('Reflection loss', 'fontweight', 'bold');
grid on
axis([0 90 -2 12])


%% 실습2
% Surface Bubble Loss
f = 20; %frequency
seta = 0:1:90; %grazing angle
U = 0:0.1:15; %wind speed

for t=1:length(seta)
    T=seta(t);

    if U < 6
    SBL = 1.26.*10.^(-3).* 6.^1.57.*f.^0.85.*exp(1.2*(U-6)) ./ sind(T);
    else
    SBL = 1.26.*10.^(-3).* U.^1.57.*f.^0.85 ./sind(T);
    end

    sbl(t,:) = SBL;
end

figure;
imagesc(U, seta, sbl);
colormap(jet)
xlabel('Wind speed(m/s)', 'fontweight', 'bold');
ylabel('Grazing angle (deg.)', 'fontweight', 'bold');
title('Surface bubble loss(Frequency : 20 kHz)', 'fontweight', 'bold');

axis ij;
caxis([0 10]);
c=colorbar;
c.Label.String='Surface loss(dB)'
c.Location='eastoutside'
