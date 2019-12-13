
function drug1
    dt = 0.02;
    dx = 0.2;

    x = 0:dx:20;
    t = 0:dt:3;

    Tmax = length(t);
    Xmax = length(x);

    u(:,1) = 0;
    u(:,Xmax) = 0;

    u(1 ,:) = (2.*x)./(1 + (x.^4)); plot(x,u(1 ,:) , 'linewidth',2); axis ([0 10 0 2]);
    hold on;

    for n = 1:(Tmax - 1) for k = 2:(Xmax - 1)
        u(n+1,k) = ((0.5*dt/(dx^2))*(u(n,k-1)-(2*u(n,k))+u(n,k+1))) + (2*dt*(u(n,k) - u(n,k-1))/dx) - u(n,k);
    end
        graph = n*dt
        if (graph==1 || graph==2 || graph==3)
            axis ([0 10 0 2]);
            plot(x,u(n,:),'linewidth',2);
            hold on;
        end
    end
    title('u(t,x) vs x');
    legend( 'u(0,x)' , 'u(1,x)', 'u(2,x)' ,'u(3,x)')
