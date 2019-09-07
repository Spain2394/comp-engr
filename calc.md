# calc.m


```syms x
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
```

### Answer 2a

|  x   |   f(x)    |
| :---:| :---:     |
| 1.6 |4.037625856572420|
| 1.8 |5.389479556705147|
| 2   |7.243197504692072|
|2.2  |9.696397926110484|
|2.4  |12.827835391164159|


### Answer 2b
i) 12.266002107092062
ii) 13.961594716180219
iii) 9.268589739934621
iv) 8.013929120299130
v) 21.534591847026682
vii) 21.975523836479347


### Answer 2c
## Accuracy compared to correspondingly labeled items in answer 2bs
i) -1.573289348819285
ii) -3.268881957907443
iii) 1.424123018338156
iv) 2.678783637973646
v)  -10.841879088753906
vi)  -11.282811078206571
