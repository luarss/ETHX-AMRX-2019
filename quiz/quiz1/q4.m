b = sym('b','real');
f = sym('f','real');
ul = sym('ul','real');
ur = sym('ur','real');

% write down the depth of point P using the symbolic parameters b, f, ul and ur
zp = b*f/(ul- ur)