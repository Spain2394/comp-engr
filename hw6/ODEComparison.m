%
% Computational Engr 8103
% Allen Spain
%
function ODEComparison

fx_x = 0;
fx_y = -1;
fy_x = 1;
fy_y = 0;

f1 = @(y) -y; % function
ff1 = @(y) fx_y + fy_x*(f1(y)); % function 2

f2 = @(x) x;
ff2 = @(x) fy_x + fx_y*f1(x);

% initial conditions
range = 10;
h = 0.5;
t(1) = 0;

x(1) = 1;
y(1) = 0;

for i=1:range/h

  %  2nd order Taylor Series method
  x(i+1) = x(i) + h*f1(y(i)) + h^2*ff1(y(i))/2;
  y(i+1) = y(i) + h*f2(x(i)) + h^2*ff2(x(i))/2;

  % 2nd order Runge-Kutta
  % x' = -y
  K1 = h*f1(y(i));
  K2 = h*(f1(y(i)) + (h*0.5*fx_y) + (0.5*K1*fx_x));
  Rx(i+1) = x(i) + ( K1 + K2 )/2;

  % y' = x
  K1 = h*f2(x(i));
  K2 = h*(f2(x(i)) + (h*0.5*fy_x) + (0.5*K1*fy_y));
  Ry(i+1) = y(i) + ( K1 + K2 )/2;

  % 4th order Runge-Kutta
  K1 = h*f1(y(i));
  K2 = h*(f1(y(i)) + (h*0.5*fx_y) + (0.5*K1*fx_x));
  K3 = h * h*(f1(y(i)) + (h*0.5*fx_y) + (0.5*K2*fx_x));
  K4 = h * h*(f1(y(i)) + (h*0.5*fx_y) + (0.5*K3*fx_x));
  Rx4(i+1) = x(i) + ( K1 + 2*K2 + 2*K3+ K4 )/6;

  K1 = h*f2(x(i));
  K2 = h*(f2(x(i)) + (h*0.5*fy_x) + (0.5*K1*fy_y));
  K3 = h * h*(f2(x(i)) + (h*0.5*fy_x) + (0.5*K2*fy_y));
  K4 = h * h*(f2(x(i)) + (h*0.5*fy_x) + (0.5*K3*fy_y));
  Ry4(i+1) = y(i) + ( K1 + 2*K2 + 2*K3 + K4 )/6;

  t(i+1) = t(i) + h; % increment the counter

end
plot(x,y,'r.-','DisplayName','2nd Order Taylor Series')
hold on
plot(Rx,Ry,'m.-','DisplayName','2nd Order Runge-Kutta')
plot(Rx4,Ry4,'b.-','DisplayName','4th Order Runge-Kutta')
hold off

lgd = legend;
lgd.NumColumns = 1;
