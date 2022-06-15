function qp = qMultiply(q,p)
%QMULTIPLY Summary of this function goes here
%   Detailed explanation goes here
q0 = q(1);
q1 = q(2);
q2 = q(3);
q3 = q(4);
p0 = p(1);
p1 = p(2);
p2 = p(3);
p3 = p(4);

qp_0 = (q0*p0-q1*p1-q2*p2-q3*p3);
qp_1 = (q0*p1+q1*p0+q2*p3-q3*p2);
qp_2 = (q0*p2+q2*p0-q1*p3+q3*p1);
qp_3 = (q0*p3+q3*p0+q1*p2-q2*p1);

qp = [qp_0;qp_1;qp_2;qp_3];
end

