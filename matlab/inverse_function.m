function inv_ans = inverse_function(x,y,z,R_06)
   % inverse of prja

   syms theta1 theta2 theta3 theta4 theta5 theta6

   d1 = (156.4+128.4)/1000;
   d2 = 5.4/1000;
   d3 = 3*6.4/1000;
   d4 = (105.9+208.4)/1000;
   d5 = 0;
   a2 = 2*210.4/1000;

   alpha = [0, pi/2, 0, -pi/2, pi/2, -pi/2];
   a = [0 0 a2 0 0 0];
   d = [d1 d2 d3 d4 d5 0];
   theta = [theta1, theta2+pi/2, theta3-pi/2, theta4, theta5, theta6];

   for i=1:6
       T_i(:,:,i) = clcT(alpha(i), a(i), theta(i), d(i));
   end

   T_i0(:,:,1) = T_i(:,:,1);
   for i=2:6
       T_i0(:,:,i) = T_i0(:,:,i-1) * T_i(:,:,i);
   end

   r = x^2 + y^2 + z^2;
   p1 = r - 2*d1*z - d3^2 - d4^2 - a2^2 + d1^2;
   c3 = p1/(2*d4*a2);
   s3 = sqrt(1 - c3^2);
   t3 = atan2(s3,c3);

   d = a2 + d4 * cos(t3);
   e = -1 * sin(t3) * d4;
   f = z - d1;
   t2 = 2 * atan((e + sqrt(e^2 + d^2 - f^2)) / (d + f));

   g1 = -1 * d4 * (sin(t2)*cos(t3) + sin(t3)*cos(t2)) - a2 * sin(t2);
   t1 = 2 * atan((d3 - sqrt(d3^2 + g1^2 - x^2)) / (g1 + x));

   t4 = 0;
   R_04 = T_i0(:,:,4);
   R_04(:,4) = [];
   R_04(4,:) = [];
   R_040 = double(subs(R_04,{theta1, theta2, theta3, theta4},{t1, t2, t3, t4}));

   R_46 = (inv(R_040)) * R_06;

   t5 = atan2(-1*sqrt(R_46(3,1)^2 + R_46(3,2)^2),R_46(3,3));
   t4 = atan2(R_46(2,3)/sin(t5),R_46(1,3)/sin(t5));
   t6 = atan2(R_46(3,2)/sin(t5),R_46(3,1)/(-1 * sin(t5)));
   tht = [t1,t2,t3,t4,t5,t6];

   inv_ans = tht;
end






