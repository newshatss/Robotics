function ang_ans = forward_function(theta1,theta2,theta3,theta4,theta5,theta6)
   % forward of prj

   d1 = (156.4+128.4)/1000;
   d2 = 5.4/1000;
   d3 = 3*6.4/1000;
   d4 = (105.9+208.4)/1000;
   d5 = 0;
   a3 = 2*210.4/1000;

   alpha = [0, pi/2, 0, -pi/2, pi/2, -pi/2];
   a = [0 0 a3 0 0 0]; 
   d = [d1 d2 d3 d4 d5 0];
   theta = [theta1, theta2+pi/2, theta3-pi/2, theta4, theta5, theta6];

   for i=1:6
       T_i(:,:,i) = clcT(alpha(i), a(i), theta(i), d(i));
   end

   T_i0(:,:,1) = T_i(:,:,1);
   for i=2:6
       T_i0(:,:,i) = T_i0(:,:,i-1) * T_i(:,:,i);
   end

   FK = T_i0(:,:,6);
   ang_ans = FK;
   
end

