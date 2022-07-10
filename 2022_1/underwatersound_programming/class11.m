% 11Week 배경소음(Ambient noise)
clear
close all
clc

v_all = [1 5 10 15]*1.944; % Wind speed
Sd = [0 1]; % Shipping density
f = 1 : 1000000; % Frequency(Hz)

N1 = 107 - 30.*log10(f); % N1 = Turbulence or seismic noise
for ii=1:length(Sd)
        % N2 = Ocean shipping noise
        N2(ii,:) = 76 - 20.*(log10(f) - log10(30)).^2 + 10.*(Sd(ii)-0.5);
end

for jj=1:length(f)
    for kk=1:length(v_all)
        v = v_all(kk);  % v가 계속 바뀜
        if f(jj) <= 1000 % 1kHz = 1000
            % N3 = Surface wave noise
            N3(kk,jj) = 44 + sqrt(21.*v) + 17.*(3-log10(f(jj))).*(log10(f(jj))-2);
        else
            N3(kk,jj) = 95 + sqrt(21.*v) - 17.*log10(f(jj));
        end
    end
end

N4 = -75 + 20.*log10(f); % N4 = Thermal noise

pp=0;
for aa=1:length(Sd)
    for bb=1:length(v_all)
        pp=pp+1;
        % NT = 총합
        NT(pp,:) = 10.*log10(10.^(N1/10) + 10.^(N2(aa,:)/10) + 10.^(N3(bb,:)/10) + 10.^(N4/10));
    end
end

figure;
set(gcf, 'color', 'w', 'position', [0 0 600 700]);
plot(f/1e3, NT(1,:), 'b--', 'linewidth', 2);
hold on
plot(f/1e3, NT(2,:), 'r--', 'linewidth', 2);
plot(f/1e3, NT(3,:), 'g--', 'linewidth', 2);
plot(f/1e3, NT(4,:), 'm--', 'linewidth', 2);
plot(f/1e3, NT(5,:), 'b-', 'linewidth', 2);
plot(f/1e3, NT(6,:), 'r-', 'linewidth', 2);
plot(f/1e3, NT(7,:), 'g-', 'linewidth', 2);
plot(f/1e3, NT(8,:), 'm-', 'linewidth', 2);
grid on
box on
set(gca, 'xscale', 'log');
title('AMBIENT NOISE SPECTRUM LEVEL', 'fontsize', 14, 'fontweight', 'bold');
xlabel('Frequency [kHz]', 'fontsize', 14, 'fontweight', 'bold');
ylabel('Sound pressure spectrum level [dB re 1μPa]', 'fontsize', 14, 'fontweight', 'bold');
legend('v=1m/s, Sd=0', 'v=5m/s, Sd=0', 'v=10m/s, Sd=0', 'v=15m/s, Sd=0', 'v=1m/s, Sd=1', 'v=5m/s, Sd=1', 'v=10m/s, Sd=1', 'v=15m/s, Sd=1', 'Location', 'northeast');
set(gca, 'fontsize', 14, 'fontweight', 'bold')
axis([10^-3 10^3 20 110]);

