function [time, position, velocity, acceleration] = trapezoidalProfile_update(distance,vmax,amax)

if vmax > sqrt(distance*amax/2)
    vmax = sqrt(distance*amax/2);
end

t1 = vmax / amax;
d1 = 0.5 * amax * t1^2;
t2 = vmax / amax;
d2 = 0.5 * amax * t2^2;
d3 = distance - d1 - d2;
t3 = d3 / vmax;
t_total = t1 + t2 + t3;

time = linspace(0, t_total, 1000);
position = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

for i = 1:length(time)
    if time(i) < t1
        position(i) = 0.5 * amax * time(i)^2;
        velocity(i) = amax * time(i);
        acceleration(i) = amax;

    elseif time(i) < t_total - t2
        position(i) = d1 + vmax * (time(i) - t1);
        velocity(i) = vmax;
        acceleration(i) = 0;

    else
        t = time(i) - (t_total - t2);
        position(i) = d1 + d3 + vmax * t - 0.5 * amax * t^2;
        velocity(i) = vmax - amax * t;
        acceleration(i) = -amax;

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


