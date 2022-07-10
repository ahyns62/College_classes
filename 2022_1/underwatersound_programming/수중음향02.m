% 행렬 계산: 합과 변환
A = [ 1 1 1; 1 2 3; 1 3 6]
sum(A)

% 행렬 계산: 곱
% (A*B), (A.*B)
A = [1 2 3]
B = [4 5 6]
X = A.*B

A = [ 5 10 20; 4 12 11; 6 7 8]
B = [ 7 12 26; 1 22 15; 16 17 18]
A*B
A.*B
A/B
A./B

%(A^2), (A.^2), (sqrt(A)), (sqrtm(A))
A = [5 10 20; 4 12 11; 6 7 8]
B = A^2
B = A.^2
B = sqrt(A)
B = sqrtm(A)

% 특수 행렬
A = eye(3)
A(:,3) = []
A(2, :) = []
A = rand(3) rand(3,3) randi(3)
R = randn(10000, 1)
hist(R, 1000)

% 형태 변환
rot90(A)
rot90(A,-1)
rot90(A,-2)
flipud(A)
fliplr(A)
A'
reshape(A,1,9)
X = 1:20:90;
A = [1 2 3; 4 5 6]
Sum_A = sum(A(end,:))

% 관계연산자
bool = 4 < 10
(3>2) + (9<5) + (12/2==3*2)
x = randperm(5), y = randperm(5)
z = x >= y
a = x == y
b = x ~= y

x = randperm(5), y = randperm(5)
z = x - y > 0
z = x >= y
z = x(x<y)

X = [8 1 6; 3 5 7; 4 9 2]
B = X >= 4

% 논리연산자
A & B % 둘 다 1일 때만 1
A | B % 최소한 둘 중 하나라도 1이면 1
~A % 반대
A && B % 둘 다 1일때만 1
A || B % 둘 중 하나라도 1이면 1
xor(X, B) % A,B 둘 중 하나만 1일 때 1 돌려줌
% 논리연산자와 숫자 계산도 가능함.


