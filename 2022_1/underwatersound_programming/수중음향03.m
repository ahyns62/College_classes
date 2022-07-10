x = [1:3];
s = 'character array';
ischar(x)
ischar(s)

A = [];
isempty(A)
A(1,1)=5; A(2,2)=3
isempty(A)

x = [-2 -1 0 1 2];
isinf(1./x)

x = [-2 -1 0 1 2];
isnan(0./x)

A = [8 0 -2; 0 3 0; -4 0 9];
[m,n,v] = find(A>3)

if x >= 0
    y = sqrt(x)
end

if x >= 0 & y >=0
    z = sqrt(x) + y
    w = log(x) - log(y)
end

%홀, 짝수 판정 프로그램
n = input('홀수,짝수를 판별할 숫자를 입력하시오:');
if rem(n,2) == 0
    fprintf('%d는(은) 짝수입니다.\n', n);
end
if rem(n,2) ~= 0
    fprintf('%d는(은) 홀수입니다.\n', n);
end

n = input('홀수,짝수를 판별할 숫자를 입력하시오:');
if rem(n,2) == 0
    fprintf('%d는(은) 짝수입니다.\n', n);
else
    fprintf('%d는(은) 홀수입니다.\n', n);
end

%벡터의 평균을 구하는 프로그램
x = input('데이터를 입력하시오:');
n = length(x);
if(~n)
    error('데이터가 입력되지 않았습니다.')
end
ave = sum(x)/n;
fprintf('평균값은 %.2f입니다.\n', ave)

% 소포 세 개 요금 계산하는 프로그램
n = input('소포의 개수를 입력하시오:');
type = input('소포의 배달 종류를 선택하시오(등기=1,보통=0):');
if type
    charge=4000*n;
else
    charge=2700*n;
end
fprintf('총 배달 요금은 %d입니다.\n', charge);

for k=2:3:10
    x = k^2
end

%for 반복문
a = rand(1000);
b = 0;
for i = 1:1000
    for j = 1:1000
        if a(i,j) > 0.5
            b = b + 1
        end
    end
end

%Switch
a = 3
switch a
    case 1
        disp('a is 1')
    case 2
        disp('a is 2')
    case 3
        disp('a is 3')
    case 4
        disp('a is 4')
    otherwise
        disp('something problem number')
end

%while
a = rand(1000);
b = 0; i = 0; j = 0;
while i < 1000
    i = i + 1
    while j < 1000
        j = j + 1
        if a(i,j) > 0.5
            b = b + 1;
        end
    end
    j = 0;
end

% Homework
n = input('반복횟수를 입력하세요: ');
while 1
    if n >= 100
        n = input('다시 100 미만 자연수를 입력하세요: ');
    else
        while(n < 100) & ( n > 0)
            for ii = 1:1:n
                disp(['' num2str(ii) ])
            end
            n = input('반복횟수를 입력하세요: ');
        end
    end
end

while 1
    n = input('반복횟수를 입력하세요 =');
    for ii = 1:1:n
        if n == 0
            break
        elseif n >= 100
            n = input('다시 100 미만 자연수를 입력하세요: ');
        else
            disp(['' num2str(ii) ])
        end
    end
end
