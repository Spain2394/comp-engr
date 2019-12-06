
function drug_Bt
    dt = 0.02;
    dx = 0.02;

    x = 0:dx:20;
    t = 0:dt:3;

    Tmax = length(t);
    Xmax = length(x);

    D = 0.5;
    F = 2.0;

    L1 = D*dt/(dx)^2;
    L2 = dt/dx;

    u(:,1) = 0;
    u(:,Xmax) = 0;

    u(1 ,:) = (2.*x)./(1 + (x.^4)); plot(x,u(1 ,:) , 'linewidth',2); axis ([0 10 0 1]);
    hold on;

    for n = 1:(Tmax-1) for k = 2:(Xmax - 1)
        u(n,k) = -(L1 + L2)*u(n+1,k-1) + (2*L1 - L2 + 1)*u(n+1,k) -L1*u(n+1,k)
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
