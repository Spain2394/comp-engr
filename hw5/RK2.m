
function RK2

fx_x = 0;
fx_y = -1;
fy_x = 1;
fy_y = 0;

% x' = -y
f1 = @(y) -y;
ff1 = @(y) fx_y + fy_x*(f1(y));

% y' = x
f2 = @(x) x;
ff2 = @(x) fy_x + fx_y*f1(x);

range = 50;
h = 1;
t(1) = 0;

x(1) = 1;
y(1) = 0;

for i=1:range/h

  % x' = -y
  K1 = h*f1(y(i));
  K2 = h*(f1(y(i)) + (h*0.5*fx_y) + (0.5*K1*fx_x));
  x(i+1) = x(i) + ( K1 + K2 )/2;

  % y' = x
  K1 = h*f2(x(i));
  K2 = h*(f2(x(i)) + (h*0.5*fy_x) + (0.5*K1*fy_y));
  y(i+1) = y(i) + ( K1 + K2 )/2;

  t(i+1) = t(i) + h;

plot(x,y,'b.-')
hold off
end


RK2()
Taylor()
