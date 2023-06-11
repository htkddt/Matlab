A=zeros(4);
B=zeros(4,1);
a1=zeros(1001,1);
a2=zeros(1001,1);
b1=zeros(1001,1);
b2=zeros(1001,1);
K=[100:1001];
for k=3:99
    phik = [-yk(k-1);-yk(k-2);uk(k-1);uk(k-2)];
    A=A+phik*phik';
    B=B+phik*yk(k);
end
for k=100:1001
    phik = [-yk(k-1);-yk(k-2);uk(k-1);uk(k-2)];
    A=A+phik*phik';
    B=B+phik*yk(k);
    theta_hat=inv(A)*B;
    a1(k)=theta_hat(1);
    a2(k)=theta_hat(2);
    b1(k)=theta_hat(2);
    b2(k)=theta_hat(2);
end
subplot(4,1,1);
plot(K,a1(K));
subplot(4,1,2);
plot(K,a2(K));
subplot(4,1,3);
plot(K,b1(K));
subplot(4,1,4);
plot(K,b2(K));