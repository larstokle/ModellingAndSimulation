i0 = 1;
L = 1;
R = 2;
i_r = 3;
Kp = 2;
h = 0.01;
t = [0 5];

k=[0 0 0 0];
i = i0;

for j = (t(1)+1):(t(2)/h+1)
	k(1) = f(i(j));
	k(2) = f(i(j)+h*k(1)/2);
	k(3) = f(i(j)+h*k(2)/2);
	k(4) = f(i(j)+h*k(3));
	i(j+1) = i(j) + (k(1) + 2*k(2) + 2*k(3) + k(4))*h/6;
end

plot(i, t(1):h:t(2)); 

%% f: calculates derivative of i given i;
function i_dot = f(i_t)
	i_dot = -(R/L + Kp)*(i_t-i_ref);

