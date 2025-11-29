function [Edisp] = ExactSol(t,M,K,u0)

% This function computes the exact solution for the Beat phenomenon.

 Lambda = eig(inv(M)*K);

 omega1 = sqrt(Lambda(1));
 omega2 = sqrt(Lambda(2));
 
 omegaB = omega2-omega1;
 omegaA = 0.5*(omega2+omega1);
 
 Edisp  = [u0*cos(0.5*omegaB*t)*cos(omegaA*t);   u0*sin(0.5*omegaB*t)*sin(omegaA*t)];
 
end