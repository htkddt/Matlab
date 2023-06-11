% function Motion_Profile_Hinh_thang(v_max,a_max,distance)
% input v_max;
% input a_max;
% input distance;
v_max = 5; 
a_max = 1; 
distance = 80; 

% Tính toán motion profile
[time, position, velocity, acceleration] = sCurveVelocityProfile(v_max, a_max, distance);

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