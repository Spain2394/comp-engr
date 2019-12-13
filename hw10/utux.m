% Solves Ut+a*Ux=0, u(t,0)=0, u(0,x)=H(x-2)
% for 0<x<5, 0<t<4 using FtBx discretization

function utux

dt = .01;
dx = .01;
a = 1;

L = a*dt/dx;
Tmax = 1 + 4/dt;
Xmax = 1 + 5/dx;

u(1:Tmax,1) = 0;
u(:,(1+2/dx):Xmax) = 1;

plot(0:dx:5,u(1,:),'linewidth',2);
title('t = 0')
axis([0 5 -.5 1.5]);
pause(.5);

for n = 1:(Tmax-1)
  for k = 2:Xmax
     u(n+1,k) = (1-L)*u(n,k) + L*u(n,k-1);
  end

  plot(0:dx:5,u(n+1,:),'linewidth',2);
  title(['t = ' num2str(round(n*dt,1))] )
  grid
  axis([0 5 -.5 1.5]);
  pause(.05);

end

% u

