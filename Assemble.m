function [M,K,C,f,L] = Assemble() 

% This function assembles mass matrix [M], damping matrix [C], 
% stiffness matrix [K] and the force vector

 m1 = 0.05;
 m2 = 0.1;
 m3 = 0.15;
 
 L  = 0.3;
 g  = 9.8;

 k11 = g*(m1+2*m2+2*m3)/L;
 k12 = -g*(m2+m3)/L;
 k13 = 0;
 k21 = -g*(m2+m3)/L;
 k22 = g*(m2+2*m3)/L;
 k23 = -g*m3/L;
 k31 = 0;
 k32 = -g*m3/L;
 k33 = g*m3/L;

 M     = [m1  0   0; 
          0   m2  0; 
          0   0   m3]; 
          
 K     = [k11  k12  k13; 
          k21  k22  k23;
          k31  k32  k33];
          
 C     = [0   0  0; 
          0   0  0; 
          0   0  0];
          
 f     = [0; 0; 0]; 
 
end
