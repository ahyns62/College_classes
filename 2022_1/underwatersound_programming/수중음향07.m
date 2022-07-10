%% 7Week
% fopen -> fprintf -> fclose

% fopen : 파일 열기
% [fid,message] = fopen('파일 이름', ['파일 열기 형식'])
a = rand(5)
b = rand(1, 5)

V = [3 16 -4 7.3];
A = [6 -2.1 15.5; -6.1 8 11];

save BinaryData
save -ascii AsciiData
save -ascii AsciiData2.txt
var = load('TestData.txt')
load TestData.txt

%fprintf : 출력을 파일에 저장
% fprintf(fid, '텍스트 %5.2f텍스트', 변수_이름)
fid = fopen('test1.dat', 'w')
x = pi;
y = pi;
z = pi;
fprintf(fid, '%1.2f %1.4f %4.6f\n', x, y, z)
fclose(fid)

fid = fopen('test2.dat', 'w')
a = -180 :5: 180;
b1 = sin(deg2rad(a));
c1 = cos(deg2rad(a));
fprintf(fid, 'sin   cos\n')
for ii = 1 : length(b1)
    fprintf(fid, '%3.2f %3.2f\n', b1(ii), c1(ii))
end
fclose(fid)

% fscanf : 데이터를 읽어 들인 후 열 벡터의 형태로 반환
% [변수] = fscanf(fid, 'format', [N,inf]);
fid = fopen('test1.dat', 'r')
data = fscanf(fid, '%f  %f  %f', [3]);
fclose(fid)


fid = fopen('test2.dat', 'r')
title_name = ['sin  cos'];

while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break;
    end
    if(strcmp(upper(tline), upper(title_name))==1)
        break;
    end
    disp(tline)
end

data = fscanf(fid, '%f %f \n', [2, inf]);
sin_data = data(1,:);
cos_data = data(2,:);
a = -180 : 5 : 180;
figure;
plot(a, sin_data, 'r', a, cos_data, 'b')
fclose(fid)

% 실습
% 1, 2)
clear
close all
clc

D = []; T = []; % 수심, 수온
for ii = 1:8
    load(['TD_sensor' num2str(ii, '%.2d') '.mat'])
    eval(['D_temp = str2double(TC_' num2str(ii,'%.2d') '(:,5));' ])
    eval(['T_temp = str2double(TC_' num2str(ii,'%.2d') '(:,4));' ])
    eval(['real_time = str2double(TC_' num2str(ii,'%.2d') '(:,2));' ])
    
    D = [D D_temp]; % depth
    T = [T T_temp]; % temperature

    eval(['clear TC_' num2str(ii,'%.2d') 'T_temp D_temp'])
end
S = 30.5*ones(size(D));

% --------- 1. Temperature-Depth sensor 8개 데이터를 불러들여 수심, 수온(plot), 음속을 그려라(pcolor).
% 4)
time = (1:size(D,1))*15/60/60;

% 5)
figure;
set(gcf, 'color', 'w', 'position', [100 100 1500 600]);

% 6, 7)
subplot(2, 3, 1);
plot(time, D);
title('Depth', 'fontsize', 16, 'color', 'b');
xlabel('Time (hour)', 'fontsize', 16);
ylabel('Depth(m)', 'fontsize', 16);
set(gca, 'fontsize', 16);
box on; % 좌표축 윤곽선 표시
grid on
axis ij;
axis([0 55 -2 12])

subplot(2, 3, 4);
plot(time, D);
title('Temperature', 'fontsize', 16, 'color', 'r');
xlabel('Time (hour)', 'fontsize', 16);
ylabel('Temperature (\circ)', 'fontsize', 16);
set(gca, 'fontsize', 16);
box on; % 좌표축 윤곽선 표시
grid on
axis ij;
axis([0 55 20 40])

zero_idx = find(D(:,1)<1);
T(zero_idx,:) = 0; D(zero_idx,:) = 0; S(zero_idx,:) = 0;
ssp = 1449.2 + 4.6*T - 0.055*T.^2 + 0.00029*T.^3 +...
    (1.34-0.01*T).*(S-35) + 0.016*D;

subplot(2,3,[2 3 5 6]);imagesc(time, [3 4 5 6 7 8 9 10], ssp');
title('Time-varying sound speed profiles','fontsize',16,'color','m')
xlabel('Time (hour)','fontsize',16)
ylabel('Depth (m)','fontsize',16)
set(gca,'fontsize',16)
axis([0 55 -2 12])
axis ij;caxis([1530 1533])
c=colorbar;
c.Label.String = 'Sound speed (m/s)';
c.Location = 'eastoutside';

idx = 1921;
a = D(idx,:);
b = T(idx,:);
c = ssp(idx,:);

% 2)
fid = fopen('LeeAHyeon.txt', 'w+') % 파일을 생성하고 쓰는 모드
fprintf(fid, '해양융합공학과\n')
fprintf(fid, '학번 : 2020076162\n')
fprintf(fid, '이름 : 이아현\n')
fprintf(fid,'\n'); %\n은 enter
fprintf(fid,'%s  \n',time(idx));
fprintf(fid,'Depth(m) Temperature(°C) Sound speed(m/s) \n');
fprintf(fid,'==========================================\n');
disp('\circC');

for ii=1:length(a)
    fprintf(fid,'  %4.2f   %10.2f     %12.2f  \n',a(ii), b(ii), c(ii));
end
fclose(fid)
