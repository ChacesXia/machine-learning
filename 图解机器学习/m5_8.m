% 高斯核模型的L1约束的最小二乘法
n=50; N=1000; x=linspace(-3,3,n)'; X=linspace(-3,3,N)';
pix=pi*x; y=sin(pix)./(pix)+0.1*x+0.2*randn(n,1);

hh=2*0.3^2; e=0.1; t0=randn(n,1); x2=x.^2;
k=exp(-(repmat(x2,1,n)+repmat(x2',n,1)-2*x*x')/hh);
k2=k^2; ky=k*y;
for o=1:1000
%     diag:取对角元素，pinv：奇异矩阵或者方针求伪逆
  t=(k2+1*pinv(diag(abs(t0))))\ky;
  if norm(t-t0)<0.001, break, end
  t0=t;
end
K=exp(-(repmat(X.^2,1,n)+repmat(x2',N,1)-2*X*x')/hh);
F=K*t;

figure(1); clf; hold on; axis([-2.8 2.8 -1 1.5]);
plot(X,F,'g-'); plot(x,y,'bo');