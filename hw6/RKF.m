function rkf

f = @(t,x) x*(1-x);
time = 16;
tolerance = 0.01;
t(1) = 0;
x(1) = 0.01;

h = 1;
i = 1;

% The adaptive step size is the same no matter what method you use
% Stiff equation stiff ode is an ode which is difficult to solve numerically
% Stiff solvers, finds the derivative in future time
while t(i) < time
  K1 = h*f(t(i),x(i)); % 6 k values
  K2 = h*f(t(i)+h/4,x(i)+K1/4);
  K3  = h*f(t(i)+3*h/8,x(i) + 3*K1/32 + 9*K2/32);
  K4 = h*f(t(i) + 12*h/13, x(i) + 1932*K1/2197 - 7200*K2/2197 + 7296*K3/2197);
  K5 = h*f(t(i) + h, x(i) + 439*K1/216 - 8*K2 + 3680*K3/513 - 845*K4/4104);
  K6 = h*f(t(i) + h/2,x(i) - 8*K1/27 + 2*K2 - 3544*K3/2565 + 1859*K4/4104 - 11*K5/40);

  % Two approximations for x(t + h) fourth order and 5th order
  x_RKF4 = x(i) + 25*K1/216 + 1408*K3/2565 + 2197*K4/4104 - K5/5;
  x_RKF5 = x(i) + 16*K1/135 + 6656*K3/12825 + 28561*K4/56430 - 9*K5/50 + 2*K6/55;



  if abs(x_RKF5-x_RKF4) < tolerance
    x(i+1) = x_RKF5;
    t(i+1) = t(i) + h;
    h = 2*h;
    i = i+1;
  else
    h = h/2;
  end
end

for t_theory = 1:1:16
    x_theory(t_theory) = 1 - 1/(1 + exp(t_theory)/99);
end

t_theory = 1:1:16
plot(t_theory,x_theory,'--b','DisplayName','2nd Order Runge-Kutta')
hold on
plot(t,x,'--r','DisplayName','2nd Order Runge-Kutta')
hold off
grid

lgd = legend;
lgd.NumColumns = 1;
