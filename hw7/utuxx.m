% Solves Ut=D*Uxx for 0<x<5, 0<t<10 using
% finite difference with the following BC's:
% u(0,x)=25
% u(t,5)=25
% u(t,0)=25 for 0<t<1
% u(t,0)=25+25*(t-1)/t for 0<t<10

function utuxx

dt = .01;
dx = .2;
D = 2;

L = D*dt/(dx^2);
Tmax = 1 + 10/dt;
Xmax = 1 + 5/dx;

u(1,1:Xmax) = 25;
u(1:Tmax,Xmax) = 25;
u(1:Tmax,1) = 25;
t = 1:dt:10;
u((1+1/dt):Tmax,1) = 25*(t-1)./t+25;

plot(0:dx:5,u(1,:),'linewidth',2);
title('t = 0');
axis([0 5 20 50]);
pause(.05);

for n = 1:(Tmax-1)
  for k = 2:(Xmax-1)
     % u(n+1,k) = (1-2*L)*u(n,k) + L*u(n,k-1) + L*u(n,k+1);
  end

  plot(0:dx:5,u(n+1,:),'linewidth',2);
  title(['t = ' num2str(round(n*dt,1))] )
  axis([0 5 20 50]);
  pause(1e-3);

end

% u
