function [time, position, velocity, acceleration] = trapzoidalVelocityProfile(v_max, a_max, distance)
% T�nh to�n profile chuy?n ??ng d?a tr�n t?c ?? h�nh tam gi�c
% v_max: v?n t?c t?i ?a (m/s)
% a_max: gia t?c t?i ?a (m/s^2)
% distance: kho?ng c�ch c?n ?i (m)

% T�nh to�n th?i gian ch?y
t_ramp = v_max / a_max;
t_const = (distance - (0.5 * v_max * t_ramp)) / v_max;
t_total = t_ramp + t_const + t_ramp;

% T�nh to�n c�c th�ng s? c?a profile chuy?n ??ng
time = linspace(0, t_total, 1000);
position = zeros(size(time));
velocity = zeros(size(time));
acceleration = zeros(size(time));

for i = 1:length(time)
    if time(i) < t_ramp
        velocity(i) = a_max * time(i);
        acceleration(i) = a_max;
        position(i) = 0.5 * a_max * time(i)^2;
    elseif time(i) >= t_ramp && time(i) < t_ramp + t_const
        velocity(i) = v_max;
        acceleration(i) = 0;
        position(i) = 0.5 * a_max * t_ramp^2 + v_max * (time(i) - t_ramp);
    else
        t = time(i) - t_ramp - t_const;
        velocity(i) = v_max - a_max * t;
        acceleration(i) = -a_max;
        position(i) = 0.5 * a_max * t_ramp^2 + v_max * t_const + v_max * t - 0.5 * a_max * t^2;
    end
end
end
