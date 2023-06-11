% function Motion_Profile_Hinh_thang(v_max,a_max,distance)
% Nh?p vào thông s? cho profile chuy?n ??ng
% input v_max;
% input a_max;
% input distance; 
v_max = 5;
a_max = 3;
distance = 10;

% S? d?ng hàm trapzoidalVelocityProfile ?? tính toán profile chuy?n ??ng
[time, position, velocity, acceleration] = trapzoidalVelocityProfile(v_max, a_max, distance);

% V? ?? th? c?a profile chuy?n ??ng
subplot(3,1,1);
plot(time, position);
xlabel('Time (s)');
ylabel('Position (m)');
title('Position Profile');

subplot(3,1,2);
plot(time, velocity);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity Profile');

subplot(3,1,3);
plot(time, acceleration);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Acceleration Profile');

