function secant

    c = @(t) 75 * exp(-1.5 * t) + 20 * exp(-0.075 * t) - 15;
    c_dt = @(t) -112.5 * exp(-1.5 * t) + -1.5 * exp(-0.075 * t);
    e = @(t_prev, t_curr) abs((t_curr - t_prev) / t_curr);

    x = 0;
    t_n0 = 0;
    t_n1 = 1;
    approx_error = 100;
    tolerance =  0.05; % 5 percent tolerance
    i=0;

    % disp('iterations    root        error')
    while (approx_error > tolerance)
        t_prev = t_n1;
        t_n1 = t_n1 - c(t_n1)*((t_n1 - t_n0)/(c(t_n1) - c(t_n0)));
        approx_error = e(t_prev, t_n1);
        i = i + 1;
        fprintf('(i) iteration: %d \n',i);
        fprintf('(ii) approximated val: %f \n',t_n1);
        fprintf('(iii)relative error: %f \n',approx_error);
        fprintf('----------------------------------------\n')
    end
