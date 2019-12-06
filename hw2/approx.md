### approx.m


```syms a b c d x

eqn1 = a + b + c + d == 0;
eqn2 = b + a - 2*(c-d) == 1; % solve by changing the value this equation equals
eqn3 = a/2 + b/2 + c + d == 0;
eqn4 = -b/3 + a/3 + d/3 - c/3 == 0;

% % form Ax = B
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4], [a, b, c, d]);

X =linsolve(A,B);

% % plot derivative and estimate
y = x^2 % write your function here
y_d = diff(y)

t = linspace(-5,5,100) %
h = 0.01 % h is an estimate
X = sym2cell(X)

df_x = subs(y_d,t);
df_est = my_estimator(t,X)
sanity_check = my_estimator(1,X)

% df_est = ((double(X{1}))*subs(y_d,(t-h)) + (double(X{2}))*subs(y_d,(t+h)) - (double(X{3}))*subs(y_d,(t+2*h)) + (double(X{4}))*subs(y_d,(t-2*h)))/(h);

figure
plot(t, df_x,'DisplayName', '-sin(x)');
hold on
plot(t, df_est,'DisplayName','df_{est}');
hold on

% % solve both about a specific x value
test_num = 5.32123

format long

df_est_e = double(my_estimator(test_num ,X, y));
df_x_e = double(subs(y_d, test_num));
error = abs(df_est_e - df_x_e)


%% define my estimator function
function y = my_estimator(t,X,y)
h = 0.1
syms x
y = x^2 % write your function here
y_d = diff(y)

y = ((double(X{1}))*subs(y_d,(t-h)) + (double(X{2}))*subs(y_d,(t+h)) - (double(X{3}))*subs(y_d,(t+2*h)) + (double(X{4}))*subs(y_d,(t-2*h)))/(6*h);
end
```
