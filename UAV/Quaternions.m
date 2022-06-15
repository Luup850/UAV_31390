q1 = [cos(0.5*pi); sin(0.5*pi); 0; 0];
q2 = [cos(0.5*pi); 0; 0; sin(0.5*pi)];
syms a b c d
q3 = [a; b; c; d]
r_1 = cos(0.5*pi)*cos(0.5*pi);
r_2 = sin(0.5*pi)*cos(0.5*pi);
r_3 = sin(0.5*pi)*sin(0.5*pi);
r_4 = cos(0.5*pi)*sin(0.5*pi);

[r_1; r_2; r_3; r_4]
syms x y z
v = [0; x; y; z];

q3*v*inv(q3)