NewtonI(0.1)

function NewtonI(tolerance)
    format long
    x = 0;
    approx_error = 1e10;
    i=0;
    % disp('iterations    root        error')
    while (approx_error > tolerance)
        i = i + 1;
        y = x - (x^3-2*x+2)
        approx_error = abs(y-x);
        x = y;
        fprintf('%5i - %.11f  %.11f \n' ,i,x,approx_error)
    end
end
