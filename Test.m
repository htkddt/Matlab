% Khai báo các thông s?
v_max = 5; % v?n t?c t?i ?a
a_max = 3; % gia t?c t?i ?a
distance = 100; % quãng ???ng di chuy?n

% Tính toán các thông s? khác
t1 = v_max / a_max; % Th?i gian gia t?c t?i ?a
t2 = (distance / v_max) - t1; % Th?i gian gi? v?n t?c t?i ?a
t3 = t1 + t2; % Th?i gian t?i ?a c?a chuy?n ??ng
k = 4 / t3; % H?ng s? trong ph??ng trình v?n t?c s-curve
t = linspace(0, t3, 1000); % M?ng th?i gian

% Tính toán v?n t?c t?i m?i th?i ?i?m
v = zeros(size(t));
for i = 1:length(t)
    if t(i) <= t1
        v(i) = a_max * t(i);
    elseif t(i) > t1 && t(i) <= t2 + t1
        v(i) = v_max;
    elseif t(i) > t2 + t1
        v(i) = v_max - a_max * (t(i) - t2 - t1);
    end
end

% V? ?? th?
plot(t, v);
title('Profile van toc S-curve');
xlabel('Thoi gian (s)');
ylabel('Van toc (m/s)');
