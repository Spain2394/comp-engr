function adaptive

f = @(t,x) x-2*t;
time = 3;
tolerance = .2;
t(1) = 0;
x(1) = 1;

h = 1;
i = 1;
% The adaptive step size is the same no matter what method you use
% Stiff equation stiff ode is an ode which is difficult to solve numerically
% Stiff solvers, finds the derivative in future time
while t(i) < time
  K1 = h*f(t(i),x(i)); % 6 k values
  K2 = h*f(t(i)+h,x(i)+K1);
  K3  = h*f(t(i)+h,x(i)+K2);
  x_RK3 =  x(i) + ( K1 + K2 + K3)/3;
  x_Euler = x(i) +  K1;
  if abs(x_RK3-x_Euler) < tolerance
    x(i+1) = x_RK3;
    t(i+1) = t(i) + h;
    h = 2*h;
    i = i+1;
  else
    h = h/2;
  end
end

plot(t,x,'bo-');
grid
