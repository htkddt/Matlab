% Nhan dang doi tuong voi he so quen lamda
N=1001;
T=0.01;
%tt=0:T:T*(N-1);
tt=1:N;
Theta = rand(4,N);
P = 1e5*eye(4);
lamda = 0.995;
for i=3:N
PHI = [-yy(i-1) -yy(i-2) uu(i-1) uu(i-2)]';
e = yy(i) - PHI'*Theta(:,i-1);
L = P*PHI / (lamda + PHI'*P*PHI);
P = 1/lamda *(P - P*PHI*PHI'*P /(lamda + PHI'*P*PHI));
Theta(:,i) = Theta(:,i-1) + L*e;
end
a1r=[-1.605*ones(500,1);-1.545*ones(501,1)];
a2r=[0.6703*ones(500,1);0.6133*ones(501,1)];
b1r=[0.4192*ones(500,1);0.4529*ones(501,1)];
b2r=[0.3668*ones(500,1);0.3847*ones(501,1)];
% Ve do thi cac he so a1, a2, b1, b2 vua nhan dang
subplot(4,1,1);
plot(tt,Theta(1,:),'r',tt,a1r,'b');
legend('a1','a1r');
grid on

subplot(4,1,2);
plot(tt,Theta(2,:),'r',tt,a2r,'b');
legend('a2','a2r');
grid on

subplot(4,1,3);
plot(tt,Theta(3,:),'r',tt,b1r,'b');
legend('b1','b1r');
grid on

subplot(4,1,4);
plot(tt,Theta(4,:),'r',tt,b2r,'b');
legend('b2','b2r');
grid on
% Hien thi gia tri Theta cuoi cung
Theta(:,N)