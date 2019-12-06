syms x
f = x^3 + sin(2*x)

%% part a

format long
x = [1.6, 1.8, 2, 2.2, 2.4]
double(subs(f, x))

%% part b
h = 0.01
fun = f
X = [-1/4, 1/4, -1/4, 1/4]


forward(2, 0.2, fun)
forward(2, 0.4, fun)

backward(2, 0.2, fun)
backward(2, 0.4, fun)

center(2, 0.2, fun)
center(2, 0.4, fun)


% calling my approximation and evaluating
my_estimator(x, 0.2, X, fun)

% estimate error
df = diff(f)

disp("Error estimation: ")
d_1 = double(subs(df,2)) - forward(2, 0.2, fun)
d_2 = double(subs(df,2)) - forward(2, 0.4, fun)

d_3 = double(subs(df,2)) - backward(2, 0.2, fun)
d_4 = double(subs(df,2)) - backward(2, 0.4, fun)

d_5 = double(subs(df,2)) - center(2, 0.2, fun)
d_6 = double(subs(df,2)) - center(2, 0.4, fun)




% define beneath here
function fwd = forward(x,h,fun)
df_est = (subs(fun,(x+h)) - subs(fun,(x)))/(h);
fwd = double(df_est);
end


function bck = backward(x,h,fun)
df_est = (subs(fun,(x)) - subs(fun,(x-h)))/(h);
bck = double(df_est);
end


function bck = center(x,h,fun)
df_est = (subs(fun,(x+h)) - subs(fun,(x-h)))/(h);
bck = double(df_est);
end

% X is coeficient matrix
% This is the approximation
function y = my_estimator(x,h,X,fun)
t = x
y_d = diff(fun)
df_est = ((-1/4)*subs(y_d,(t-h)) + (1/4)*subs(y_d,(t+h)) - (1/4)*subs(y_d,(t+2*h)) + 1/4*subs(y_d,(t-2*h)))/h;
y = double(df_est);
end
