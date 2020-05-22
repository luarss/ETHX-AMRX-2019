% x(1) = xk, x(2) = yk, x(3) = theta_k
% m(1) = xm, m(2) = ym.
rot = @(x) [cos(x(3)) sin(x(3)); -sin(x(3)) cos(x(3))];
h = @(x, m) rot(x)*[m(1)-x(1); m(2)-x(2)];
Hx = @(x,m) [-cos(x(3)) -sin(x(3)) (x(1)-m(1))*sin(x(3)) - (x(2)-m(2))*cos(x(3));...
            sin(x(3)) -cos(x(3)) (x(1)-m(1))*cos(x(3)) + (x(2)-m(2))*sin(x(3))];

%%% SECTION FOR SELF-EVALUATION. PLEASE DO NOT EDIT BELOW THIS LINE %%%

x = [1.; 0. ; pi/4]
m = [3.; 4.]

h_eval = h(x, m)
Hx_eval = Hx(x, m)