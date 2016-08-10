n = 50;
N = 1000;
x = linspace(-3,3,n)';
X = linspace(-3,3,N)';
pix = pi*x;
y = sin(pix)./(pix)  + 0.1*x + 0.2*randn(n,1);

p(:,1) = ones(n,1);
P(:,1) = ones(N,1);
for j = 1:15
    p(:,2*j) = sin(j/2*x); p(:,2*j+1) = cos(j/2*x);
    P(:,2*j) = sin(j/2*X); P(:,2*j+1) = cos(j/2*X);
end
t = p\y;
%基本最小二乘
F = P*t;
%部分空间约束最小二乘，设计矩阵 = 设计矩阵*正交投影矩阵P
t2 = (p*diag([ones(1,11) zeros(1,20)]))\y;
F2 = P*t2;

figure(1);
clf;
hold on;
axis([-3 3 -1 2]);
plot(X,F,'g-');
plot(x,y,'bo');
plot(X,F2,'r-');