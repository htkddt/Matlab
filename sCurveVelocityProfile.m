function [time, position, velocity, acceleration] = sCurveVelocityProfile(v_max, a_max, distance)
% Tính toán profile chuy?n ??ng d?a trên t?c ?? hình cong
% v_max: v?n t?c t?i ?a (m/s)
% a_max: gia t?c t?i ?a (m/s^2)
% distance: kho?ng cách c?n ?i (m)

% Tính toán th?i gian ch?y
t_ramp = v_max/a_max;
t_const = (distance - (0.5 * v_max * t_ramp)) / v_max;
t_total = t_ramp + t_const + t_ramp;

% Tính toán các thông s? c?a profile chuy?n ??ng
time = linspace(0, t_total, 1000);
position = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

for i = 1:length(time)
    if time(i) <= t_ramp
        position(i) = (v_max^2 / (2 * a_max)) * (1 - cos(a_max * time(i) / v_max));
        velocity(i) = v_max * sin(a_max * time(i) / v_max)/sin(1);
        acceleration(i) = a_max * cos(a_max * time(i) / v_max);
    elseif time(i) > t_ramp && time(i) < t_ramp + t_const
        position(i) = (v_max^2 / (2 * a_max)) * (1 - cos(a_max * t_ramp / v_max)) + v_max * (time(i) - t_ramp);
        velocity(i) = v_max;
        acceleration(i) = 0;
    elseif time(i) >= t_ramp + t_const
        t = time(i) - t_ramp - t_const;
        position(i) = distance - (v_max^2 / (2 * a_max)) * (1 - cos(a_max * t_ramp / v_max)) - v_max * t + (v_max^2 / (2 * a_max)) * (1 - cos(a_max * t / v_max));
        velocity(i) = v_max - v_max * sin(a_max * t / v_max)/sin(1);
        acceleration(i) = -a_max * sin(a_max * t / v_max);
    end
end
end
