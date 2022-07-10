%% 6Week
% 3/23
while 1
    n = input('반복 회수를 입력하세요 (100 미만의 자연수 값, 0 입력하면 프로그램 종료) \n =>');
    if (n >= 100)||(n < 0)||((n-ceil(n))~=0)
        disp('다시 입력하세요')
    elseif n == 0
        fprintf('\n'), break;
    else
        fprintf('---------\n'), fprintf('번호 =')
        for i = 1 : n
            fprintf('%2d', i)
            if i < n, pause(0.1), fprintf('\b\b'), end
    end
    fprintf('\n%d번 반복하였습니다.\n', n)
    fprintf('---------------------\n\n')
   end
end
disp('프로그램을 종료합니다')

% 히스토그램 예제
% 5월 낮 최고기온에 대한 다음 데이터로 히스토그램을 그려라.
y = [12 14 15 14 17 18 19 21 20 21 23 22 29 30 29 ...
28 27 26 24 23 22 20 18 17 18 19 20 21 22 24];
hist(y), xlabel('기온(섭씨)'), ylabel('일 수');
title('\bf\fontsize{12}오정동의 5월달 낮 최고기온')

% 데이터 범위를 세 단계로 지정
[n, x] = hist(y, 3);
bar(x, n, 'm'), xlabel('기온(섭씨)'), ylabel('일 수');
title('\bf\fontsize{12}오정동의 5월달 낮 최고기온')

% 그래프 예제
% 1) 세로 막대 그래프(bar(x,y))
x = [1988:1994];
y = [8 12 20 22 18 24 27];
bar(x, y, 'r') % x위치에 y크기
xlabel('Year')
ylabel('Sales(Millions)')

% 2) 가로 막대 그래프(barh(x,y))
x = [1988:1994];
y = [8 12 20 22 18 24 27];
barh(x, y) % x위치에 y크기
xlabel('Sales(Millions)')
ylabel('Year')

% 3) 계단 그래프(stairs(x,y))
x = [1988:1994];
y = [8 12 20 22 18 24 27];
stairs(x, y)
xlabel('Year')
ylabel('Sales(Millions)')

% 4) 스템 그래프(stem(x,y))
x = [1988:1994];
y = [8 12 20 22 18 24 27];
stem(x, y)
xlabel('Sales(Millions)')
ylabel('Year')

% 5) 원 그리기
theta = linspace(0, 2*pi, 100);
x = cos(theta); y = sin(theta);
plot(x, y)
grid on
or polarplot(theta, 1*ones(1,length(theta)))
axis equal

% 6) 파이 그래프(pie(x)
grd = [11 18 26 9 5];
pie(grd)
title('Class Grades')

% 그래프 예제-3차원
z = peaks;
[c, h] = contour(z, 20);
set(gcf, 'color', 'y')
clabel(c)

[c, h] = contourf(peaks, 20);
set(gcf, 'color', 'y')
clabel(c)

z = peaks;
pcolor(z);
shading faceted

[X, Y] = meshgrid(-3:.125:3);
Z = peaks(X, Y);
mesh(X, Y, Z);
axis([-3 3 -3 3 -10 10])

[X, Y] = meshgrid(-3:.125:3);
Z = peaks(X, Y);
meshc(X, Y, Z);
axis([-3 3 -3 3 -10 10])

[X, Y] = meshgrid(-3:.125:3);
Z = peaks(X, Y);
waterfall(X, Y, Z);
axis([-3 3 -3 3 -10 10])

% 예제 : 2차원 그래프
x = -100 : 10 : 100;
y1 = 1*x;
y2 = 2*x.^2;
y3 = 3*x.^3;
figure
set(gcf, 'position', [100 100 600 500])
set(gcf, 'color', 'g');

subplot(2, 2, 1);
plot(x, y1, 'b-+', 'linewidth', 2, 'markerEdgeColor', 'm', 'markersize', 7);
legend('1차 함수', 'location', 'southeast');
set(gca, 'fontsize', 13, 'fontweight', 'bold');
xlabel('x value'), ylabel('y value');
title('1차 함수', 'fontsize', 13, 'fontweight', 'bold');

subplot(2, 2, 2);
plot(x, y2, 'r:d', 'linewidth', 2, 'markerEdgeColor', 'k', 'markersize', 7);
legend('2차 함수', 'location', 'southwest');
set(gca, 'fontsize', 13, 'fontweight', 'bold');
xlabel('x value'), ylabel('y value');
title('2차 함수', 'fontsize', 13, 'fontweight', 'bold');

subplot(2, 2, 3:4);
plot(x, y3, 'g--S', 'linewidth', 2, 'markerEdgeColor', 'k', 'markersize', 7);
legend('3차 함수', 'location', 'northwest');
set(gca, 'fontsize', 13, 'fontweight', 'bold');
xlabel('x value'), ylabel('y value');
title('3차 함수', 'fontsize', 13, 'fontweight', 'bold');

grid on
