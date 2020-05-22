f = @(x, u) x + [u(1)*cos(x(3) + u(2)); u(1)*sin(x(3) + u(2)); u(2)];
Fx = @(x,u) [1 0 -u(1)*sin(x(3) + u(2)); 0 1 u(1)*cos(x(3)+u(2)); 0 0 1];
Fu = @(x,u) [cos(x(3) + u(2)) -u(1)*sin(x(3) + u(2));...
            sin(x(3) + u(2)) u(1)*cos(x(3) + u(2));...
            0 1];

%%% SECTION FOR SELF-EVALUATION. PLEASE DO NOT EDIT BELOW THIS LINE %%%

x = [1.; 2. ; pi/4]
u = [.1; pi/8]

f_eval = f(x,u)
Fx_eval = Fx(x,u)
Fu_eval = Fu(x,u)