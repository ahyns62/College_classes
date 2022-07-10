% 12Week 다중경로 음파 전달
% S: TL계산, B : TL, BL 계산
% 음파 거리 : sqrt(RR^2 + (SD+RD)^2)
f=10; % 주파수
u=10; % 바람 속도
c1=1500; % 수층 음속
c2=1800; % 해저면 음속
p1=1; % 수층 밀도
p2=2; % 해저면 밀도

SD=20; % 송신기 수심
RD=40; % 수신기 수심
RR=200; % 송수신기간 거리
WD=100; % 해역 수심

%% 1 다중경로 전달거리 계산
D_R= sqrt((SD-RD)^2+RR^2); % 직접 전달 경로
S_R= sqrt((SD+RD)^2+RR^2); % 해수면 경로
B_R= sqrt((WD-SD+WD-RD)^2+RR^2); % 해저면 경로
SB_R= sqrt((WD+SD+WD-RD)^2+RR^2); % 해수면-해저면 경로
BS_R= sqrt((WD-SD+WD+RD)^2+RR^2); % 해저면-해수면 경로


% 수층 음파전달(TL)
a=3.3*10^-3+0.11*f^2/(1+f^2) + 44*f^2/(4100+f^2) + 3.0*10^-4*f^2;

D_TL= 2*10*log10(D_R) + a*D_R/1000;
S_TL= 2*10*log10(S_R) + a*S_R/1000;
B_TL= 2*10*log10(B_R) + a*B_R/1000;
SB_TL= 2*10*log10(SB_R) + a*SB_R/1000;
BS_TL= 2*10*log10(BS_R) + a*BS_R/1000;

%S
S_t= atan(60/200);
S_SBL= (1.26 * 10^-3)/sin(S_t)* (u^1.57)* f^0.85;

%B
c1=1500;
c2=1800;
p1=1;
p2=2;

B_t1=atan(140/200);
B_t2=acos( (c2/c1) * cos(B_t1));
B_Rc= (p2*c2*sin((B_t1))-p1*c1*sin(B_t2)) / (p2*c2*sin((B_t1)) + p1*c1*sin(B_t2));
B_BL= -20*log10(abs(B_Rc));

%BS
BS_t1=atan(220/200);
BS_t2=acos((c2/c1)*cos((BS_t1)));
BS_Rc=(p2*c2*sin((BS_t1))-p1*c1*sin(BS_t2)) / (p2*c2*sin((BS_t1)) + p1*c1*sin(BS_t2));
BS_BL= -20*log10(abs(BS_Rc));

BS_SBL= (1.26 * 10^-3)/sin(BS_t1)* (u^1.57)* f^0.85;

%SB
SB_t1=atan(180/200);
SB_t2=acos( (c2/c1) *cos((SB_t1)));
SB_Rc=(p2*c2*sin((SB_t1))-p1*c1*sin(SB_t2)) / (p2*c2*sin((SB_t1)) + p1*c1*sin(SB_t2));
SB_BL= -20*log10(abs(SB_Rc));

SB_SBL= (1.26 * 10^-3) / sin(SB_t1)* (u^1.57)* f^0.85;

% 다중경로 에너지(dB)
D_A= -D_TL;
S_A= -S_TL-S_SBL;
B_A= -B_TL-B_BL;
BS_A=-BS_TL -BS_BL -BS_SBL;
SB_A= -SB_TL -SB_BL -SB_SBL;

A=[D_A S_A B_A SB_A BS_A ];

% 다중경로 에너지(amplitude)
amp=10.^(A./20);
CIR_T= [D_R S_R B_R SB_R BS_R]./1500;

figure;
set(gcf,'position',[100 100 1000 600]);
subplot(2,1,1)
stem(CIR_T,A)
title('Channel impulse response','Fontsize',16,'FontWeight','Bold')
ylabel('Transmission loss (dB)','fontsize',16)
ylim([-70 0]);
set(gca,'fontsize',16)
box on;grid on;
hold on;

subplot(2,1,2)
stem(CIR_T,amp)
xlabel('Arrival time(s)','fontsize',16)
ylabel('Amplitude','fontsize',16)
set(gca,'fontsize',16)
ylim([0 0.006]);
box on;grid on;
