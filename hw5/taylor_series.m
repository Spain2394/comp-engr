%
% Taylor's series second order method 
% Allen Spain
%

function Taylor

f = @(t,x) 1 + t + x^2;

ff = @(t,x) 1 + 2*x + 2*x*t + 2*x^3;

time = 4;
h = 1;
t(1) = 0;
x(1) = 1;

for i=1:time
  x(i+1) = x(i) + h*f(t(i),x(i)) + h^2*ff(t(i),x(i))/2;
  t(i+1) = t(i) + h;
  if (i == 1)
      fprintf('index:%i %i\n', 0 , 1)
  end
  fprintf('index:%i %i\n',i,x(i+1))
end

plot(t,x,'.-');
savefig('./latex/docs/euler.fig')
