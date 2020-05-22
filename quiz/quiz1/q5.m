F = str2sym('F(x, y)');
G = str2sym('G(x, y)');
syms x y

% write down the formula to compare two image patches via SSD 
%via x
e = symsum((F-G).^2, x, -2, 2);
%via y
e = symsum(e, y, -2, 2)