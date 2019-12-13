function bisect

    % c = @(t) 75 * exp((-1.5 * t))) + (20 * exp((-0.075 * t))) - 15;
    % c = @(t) (75 * exp((-1.5*t)) + (20*exp(-0.075*t))) - 15;
    c = @(t) (75 * exp((-1.5 * t))) + (20 * exp((-0.075 * t))) - 15;
    % c_dt = @(t) -112.5 * exp(-1.5 * t) + -1.5 * exp(-0.075 * t);
    % e = @(t_prev, t_curr) abs((t_curr - t_prev) / t_curr);
    e = @(x_1,x_2) abs((x_2 - x_1)/ 2);

    x_1 = 0
    x_2 = 10
    approx_error = 100;
    tolerance =  0.05; % 5 percent tolerance
    i=1;

    % disp('iterations    root        error')
    while (approx_error > tolerance)
        tmp = (x_1 + x_2)/2;
        if (c(x_1) * c(x_2) < 0)
            x_2 = tmp;
        else
            x_1 = tmp;
        end
        approx_error = e(x_1, x_2);

        fprintf('(i) iteration: %d \n',i);
        fprintf('(ii) approximated val: %f \n',tmp);
        fprintf('(iii)relative error: %f \n',approx_error);
        fprintf('----------------------------------------\n')
        i = i + 1;
    end

    % function cfunc = c(t)
    % cfunc = (75 * exp((-1.5 * t))) + (20 * exp((-0.075 * t))) - 15;
    % end
