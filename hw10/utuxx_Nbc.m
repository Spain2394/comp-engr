% Solves Ut=D*Uxx for 0<x<5, 0<t<20 using 
% finite difference with the following BC's:
% u(0,x)=25
% u(t,5)=25
% ux(t,0)= -5

function utuxx_Nbc

dt = .01;
dx = .2;
D = 2;

L = D*dt/(dx^2);
Tmax = 1 + 20/dt;
Xmax = 1 + 5/dx;

u(1,1:Xmax) = 25;
u(1:Tmax,Xmax) = 25;

plot(0:dx:5,u(1,:),'linewidth',2);
title('t = 0');
axis([0 5 20 50]);
pause(.05);

for n = 1:(Tmax-1)
  u(n+1,1) = (1-2*L)*u(n,1) + 2*L*u(n,2) + 10*L*dx;
  for k = 2:(Xmax-1)
     u(n+1,k) = (1-2*L)*u(n,k) + L*u(n,k-1) + L*u(n,k+1);
  end

  plot(0:dx:5,u(n+1,:),'linewidth',2);
  title(['t = ' num2str(round(n*dt,1))] )
  axis([0 5 20 50]);
  grid
  pause(1e-3);

end

% u

