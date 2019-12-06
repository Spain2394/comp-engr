% Solves Ut=D*Uxx for 0<x<5, 0<t<10 using backward
% time discretization with the following BC's:
% u(0,x)=25
% u(t,5)=25
% u(t,0)=25 for 0<t<1
% u(t,0)=25+25*(t-1)/t for 0<t<10

function utuxx_Bt

dt = .1;
dx = .1;
D = 2;
F = 2;

L1 = D*dt/(dx^2);
L2 = F/(dx^2);
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

M = (1+2*L)*eye(Xmax-2);
M = M - L*diag(ones(1,Xmax-3),1);
M = M - L1*diag(ones(1,Xmax-3),-1);

for n = 1:(Tmax-1)

  b = u(n,2:(Xmax-1));
  b(1) = b(1) + L1*u(n+1,1);
  b(Xmax-2) = b(Xmax-2) + L1*u(n+1,Xmax);
  u(n+1,2:(Xmax-1)) = M.\b;

  L1ot(0:dx:5,u(n+1,:),'linewidth',2);
  title(['t = ' num2str(round(n*dt,1))] )
  axis([0 5 20 50]); grid
  pause(1e-3);

  if (n*dt==1 || n*dt==2 || n*dt==3)
      axis ([0 10 0 2]);
      plot(x,u(n,:),'linewidth',2);
      hold on;

end

% u
