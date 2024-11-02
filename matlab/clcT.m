function mat_ans = clcT(alpha, a, theta, d)
  r_z_theta = [cos(theta) -sin(theta) 0 0;
               sin(theta)  cos(theta) 0 0;
               0           0          1 0;
               0           0          0 1];

  r_x_alpha = [1           0                    0                     0;
               0           round(cos(alpha),3)  round(-sin(alpha),3)  0;
               0           round(sin(alpha),3)  round(cos(alpha),3)   0;
               0           0                    0                     1];
  t_x_a = [1 0 0 a;
           0 1 0 0;
           0 0 1 0;
           0 0 0 1];

  t_z_d = [1 0 0 0;
           0 1 0 0;
           0 0 1 d;
           0 0 0 1];
  mat_ans = r_x_alpha * t_x_a * r_z_theta * t_z_d;
end



