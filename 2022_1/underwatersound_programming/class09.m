clear
close all
clc

%% 실습
f = 0.1 : 0.001 : 1000; % 주파수
T = [0 10 20 30]; % 수온
ph = 8; 
s = 35; % 염분
z = 0; % 수심
c = 1500; % 음속
alpha = zeros(length(T),length(f)); % 행렬 초기화, T 길이만큼의 행, f 길이만큼의 열을 갖는 0의 행렬을 만듦

for p = 1:length(T) % p를 1부터 T의 길이(=4)까지 1씩 증가시키면서 반복되는 루프.
t = T(p); % t에 T의 p번째 값을 입력. 루프가 돌면서 t는 0, 10, 20, 30의 값을 갖게 됨.

%%% Boric Acid Relaxation
a1 = 8.68/c*10^(0.78*ph-5);
p1 = 1;
f1 = 2.8*(s/35)^0.5*10^(4-1245/(273+t));

%%% Magnesium Sulfate Relaxation
a2 = 21.44*s/c*(1+0.025*t);
p2 = 1-137*1e-4*z+6.2*1e-9*z^2;
f2 = 8.17*10^(8-1990/(273+t))/(1+0.0018*(s-35));

if t <= 20 % t가 20이하 일때 아래라인 실행. 아니면 else 이후의 라인 실행

%%% Viscositiy for T <= 20
    a3 = 4.937*1e-4-2.59*1e-5*t+9.11*1e-7*t^2-1.50*1e-8*t^3;
else
%%% Viscositiy for T > 20
    a3 = 3.964*1e-4-1.146*1e-5*t+1.45*1e-7*t^2-6.50*1e-10*t^3;
end
p3 = 1-3.83*1e-5*z+4.9*1e-10*z^2;

%%% FG attenuation
fac_mgso4(p,:) = a1*p1*f1*f.^2./(f.^2+f1^2);
fac_boh3(p,:) = a2*p2*f2*f.^2./(f.^2+f2^2);
fac_vis(p,:) = a3*p3*f.^2;
alpha(p,:) = fac_mgso4(p,:) + fac_boh3(p,:) + fac_vis(p,:);
end
alpha_thp = 3.3*1e-3 + 0.11*f.^2./(1+f.^2) + 44*f.^2./(4100+f.^2) + 3*1e-4*f.^2;

%%% ploting
figure;set(gcf,'position',[300 100 900 600])

subplot(1,2,1)
plot(f,fac_mgso4(2,:),'--b','linewidth',1);hold on
plot(f,fac_boh3(2,:),'-.r','linewidth',1);
plot(f,fac_vis(2,:),'-m','linewidth',1);
plot(f,alpha(2,:),'-k','linewidth',3);
plot(f,alpha_thp,'-','color',[0 0.45 0.74],'linewidth',3);grid on
set(gca, 'xscale', 'log', 'yscale', 'log')
xlabel('Frequency [kHz]','fontweight','bold')
ylabel('Attenuation [dB/km]','fontweight','bold')
legend('FG model: MgSO_4','FG model: B(OH)_3','FG model: Pure water','FG model: Total','Thorp model','location','best')
set(gca,'fontweight','bold')
axis([1e-1 1e3 1e-4 1e3])

subplot(1,2,2)
plot(f,alpha(1,:),'-b','linewidth',1);hold on
plot(f,alpha(2,:),'-r','linewidth',1);
plot(f,alpha(3,:),'-m','linewidth',1);
plot(f,alpha(4,:),'-k','linewidth',1);grid on
set(gca, 'xscale', 'log', 'yscale', 'log')
xlabel('Frequency [kHz]','fontweight','bold')
ylabel('Attenuation [dB/km]','fontweight','bold')
legend('0 \circC','10 \circC','20 \circC','30 \circC','location','best')
set(gca,'fontweight','bold')
axis([1e-1 1e3 1e-4 1e3])
