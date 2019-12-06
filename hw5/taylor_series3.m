%
% Taylor's third order method for
% Allen Spain
%

function Taylor

f = @(t,x) 1 + t + x^2;

ff = @(t,x) 2*x*t + 2*x*t^2  + 12* x^2 + 2*x^3 + 2*x^2*t + 12 * x^4;

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

<<<<<<< HEAD
plot(t,x,'b.-');
=======
plot(t,x,'.-');
>>>>>>> 31adf8bead0ca3f0783d74f4a70004e23d603956
savefig('./latex/docs/euler.fig')
