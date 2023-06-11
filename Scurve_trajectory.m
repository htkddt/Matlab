function [time, position, velocity, acceleration] = Scurve_trajectory(distance,vmax,amax)

if vmax > sqrt(distance*amax/2)
    vmax = sqrt(distance*amax/2);
end
    
t1 = vmax/amax;
t2 = 2*t1;
t3 = distance/vmax;
t4 = t3 + t1;
tf = t3 + t2;
j = amax/t1; % Do giat (Jerk) la dao ham cua gia toc theo thoi gian

time = linspace(0, tf, 100);
position = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

for i = 1:length(time)
    if time(i) <= t1
        position(i) = j*time(i)^3/6;   
        velocity(i) = j*time(i)^2/2;   
        acceleration(i) = j*time(i);
    elseif time(i) <= t2
        position(i) = j*t1^3/6 + j*t1^2/2*(time(i)-t1) + amax*(time(i)-t1)^2/2 - j*(time(i)-t1)^3/6;
        velocity(i) = j*t1^2/2 + amax*(time(i)-t1) - j*(time(i)-t1)^2/2;
        acceleration(i) = amax - j*(time(i)-t1);
    elseif time(i) <= t3
        position(i) = amax*t1^2 + vmax*(time(i)-t2);
        velocity(i) = vmax;
        acceleration(i) = 0;
    elseif time(i) <= t4
        position(i) = amax*t1^2 + vmax*(t3-t2) + vmax*(time(i)-t3) - j*(time(i)-t3)^3/6;
        velocity(i) = vmax - j*(time(i)-t3)^2/2;
        acceleration(i) = -j*(time(i)-t3);
    elseif time(i) <= tf
        position(i) = distance - j*(tf - time(i))^3/6;
        velocity(i) = vmax - j*(t4-t3)^2/2 - amax*(time(i)-t4) + j*(time(i)-t4)^2/2;
        acceleration(i) = -amax + j*(time(i)-t4);
    end
end
    
figure;
subplot(3,1,1);
plot(time, position);
xlabel('Time (s)');
ylabel('Position (m)');
title('Position vs. Time');

subplot(3,1,2);
plot(time, velocity);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs. Time');

subplot(3,1,3);
plot(time, acceleration);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Acceleration vs. Time');
end