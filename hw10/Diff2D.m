% Numerical solution for diffusion equation
% in 2 dimension

function Diff2D

D = 2;
dt = .005;
dx = .2;
time = 3;

L = D*dt/(dx^2);
Nmax = 1 + time/dt;
Kmax = 1 + 10/dx;

u( 1:Kmax, 1:Kmax ) = 25; % IC
u( 1, : ) = 5;     % Top BC
u( Kmax, : ) = 80; % Bottom BC
u( :, 1 ) = 25;   % Left BC
u( :, Kmax ) = 25; % Right BC

[x,y] = meshgrid( 0:dx:10, 10:-dx:0 );
surf(x,y,u);
view(215,20);

for n = 1:Nmax
  for i = 2:(Kmax-1)
    for j = 2:(Kmax-1)    
      v(i,j) = (1-4*L)*u(i,j)+L*u(i-1,j)+L*u(i+1,j)+L*u(i,j-1)+L*u(i,j+1);
    end
  end
  u(2:Kmax-1,2:Kmax-1) = v(2:Kmax-1,2:Kmax-1);  
  surf(x,y,u);
  view(215,20);
  title(['time = ' num2str(dt*(n-1))]);
  pause(1e-10);
end
