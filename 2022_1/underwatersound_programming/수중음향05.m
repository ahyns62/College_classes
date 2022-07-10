%% Quiz 1 - 흐름 제어문 이용
% 1) T1~T5 의 depth 별 수온을 행렬로 구성하고, 
% 위의 공식을 이용하여 ssp(sound speed profile)를 구하라
T = [22 21 19 17 15 
     23 23 20 16.5 14
     22.5 22 20.5 17 15
     22 21 18.5 16 15
     21 21 20 18 14];
S = 35;
z = [0 20 50 75 100];
C = 1449.2 + 4.6.*T - 0.055.*T.^2 + 0.00029.*T.^3 + (1.34-0.01.*T).*(S-35) + 0.016.*z;

for ii = 1:size(T,1)
    C(ii,:) = 1449.2 + 4.6.*T(ii,:) - 0.055.*T(ii,:).^2 + 0.00029.*T(ii,:).^3 + (1.34-0.01.*T(ii,:)).*(S-35) + 0.016.*z;
end

%% 그래프 생성 예시

% 알고리즘
FREQ = [10];
RANGE = 1 : 20 : 2001;
alpha = ((0.1*FREQ^2)/(1+FREQ^2))+((40*FREQ^2)...
    /(4100+FREQ^2))+2.75*10^-4*FREQ^2+0.003;
TL_dB_Spherical = 20*log10(RANGE) + (alpha)*RANGE/1000;
TL_dB_Cylindrical = 10*log10(RANGE) + (alpha)*RANGE/1000;

% 그래프 생성
figure;set(gcf,'position',[177 63 1000 600], 'color', [1 1 1]);
plot(RANGE,-TL_dB_Spherical, 'bo--', 'linewidth', 3, 'MarkerSize', 10);
hold on;
plot(RANGE, -TL_dB_Cylindrical, 'rs--', 'linewidth', 3, 'MarkerSize', 10);
xlabel('Range (m)', 'fontsize', [14], 'fontweight', 'bold');
ylabel('TL (dB)', 'fontsize', [14], 'fontweight', 'bold');
set(gca, 'fontsize', 16, 'fontweight', 'bold');
title('Transmission loss \color{blue}\it(TL)', 'fontsize', [14], 'fontweight', 'bold');
text(mean(RANGE), -mean(TL_dB_Spherical)+5, '구형 분산', 'fontsize', [16], ...
    'fontweight', 'bold', 'EdgeColor', 'y', 'LineWidth', 2)
text(mean(RANGE), -mean(TL_dB_Cylindrical)+5, '실린더 분산', 'fontsize', [16], ...
    'fontweight', 'bold', 'EdgeColor', 'y', 'LineWidth', 2)
grid on
legend('구형 분산', '실린더 분산', 'location', 'best');
axis([0 max(RANGE) - 80 0]); set(gcf, 'Name', 'Fig. 4-1')

%% plot 명령어
a = - 180 : 180; % -180부터 180까지 간격 1
b = sin(deg2rad(a)); % deg2rad : degree 값을 radian 값으로 변경
plot(a,b)

%% 그래프 형식 지정 예시
a = 0 : 10 : 720;
b = sin(deg2rad(a));
c = cos(deg2rad(a));
plot(a, b, 'linewidth', 3, 'MarkerSize', 10)
hold on
plot(a, c, 'linewidth', 3, 'MarkerSize', 10)

a = 0 : 10 : 720;
b = sin(deg2rad(a));
c = cos(deg2rad(a));
plot(a, b, 'bo--', 'linewidth', 3, 'MarkerSize', 10)
hold on
plot(a, c, 'rs--', 'linewidth', 3, 'MarkerSize', 10)

%% 데이터 plot 예제
yr = [1988:1994];
sales = [8 12 20 22 18 24 27];
plot(yr, sales, '--r*', 'LineWidth', 2, ...
    'MarkerSize', 12)
plot(yr, sales, 'r*--', 'LineWidth', 2, ...
    'MarkerSize', 12)
plot(yr, sales, 'r--*', 'LineWidth', 2, ...
    'MarkerSize', 12)

%% 함수를 이용한 그래프 그리기
x = [-2:0.3:4];
y = 3.5.^(-0.5*x).*cos(6*x);
plot(x, y)

x = [-2:0.01:4];
y = 3.5.^(-0.5*x).*cos(6*x);
plot(x, y)

%% 한 그래프에 여러 곡선 출력
a = 0 : 10 : 720;
b = sin(deg2rad(a));
c = cos(deg2rad(a));
plot(a,b,'bo--',a,c,'rs--')

a = 0 : 10 : 720;
b = sin(deg2rad(a));
c = cos(deg2rad(a));
plot(a,b,'o--',a,c,'s--')

%% hold on를 이용한 다중 그래프
a = 0 : 10 : 720;
b = sin(deg2rad(a));
c = cos(deg2rad(a));
plot(a,b,'bo--','linewidth',3)
hold on
plot(a,c,'rs--','linewidth',3)

%% axis 명령어와 grid 명령어
x = 0: 0.02: pi/2;
plot(x, tan(x), '-ro')
axis([0 pi/2 0 5])
grid on

%% get, set을 이용한 그래픽 활용
a = 0 : 5 : 180;
b1 = sin(deg2rad(a))
plot(a,b1,':')

a = 0 : 5 : 180;
b1 = sin(deg2rad(a));
h = plot(a,b1)
set(h,'linestyle',':')

set(gcf, 'Position', [100 317 999 500], 'Color', [1 1 1])

a = 0 : 5 : 180;
b1 = sin(deg2rad(a));
plot(a,b1,':')
set(gca,'ydir','reverse')
h = xlabel('m');
set(h, 'fontsize', 16, 'fontweight', 'bold');
g = ylabel('m/s');
set(g,'fontsize',16,'fontweight','bold');
set(gca, 'fontsize', 14, 'fontweight', 'bold');

%% 그래프의 2중축 표현
a = -180 : 180;
b1 = sin(deg2rad(a));
c1 = 4*cos(deg2rad(a));
plotyy(a,b1,a,c1)

a = -180 : 180;
b1 = sin(deg2rad(a));
c1 = 4*cos(deg2rad(a));
[haxes,x,y] = plotyy(a,b1,a,c1)
axes(haxes(1))
ylabel('sin value')
axes(haxes(2))
ylabel('cos value')
set(x, 'marker', '+', 'LineStyle', '--', ...
    'linewidth', 2, 'markersize', 7)
set(y, 'marker', 'S', 'LineStyle', ':', ...
    'linewidth', 2, 'markersize', 7)


