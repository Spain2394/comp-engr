### approx2.m

```syms a b c d x

eqn1 = b - a/3 - c + d/3 == 5;
eqn2 = a + b + 2*c + 2*d == 0; % solve by changing the value this equation equals
eqn3 = b - a +2*d + 2 * c == 0;
eqn4 = b - a + 2*d -2*c == 0;

% % form Ax = B
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4], [a, b, c, d]);

X =linsolve(A,B)
```
