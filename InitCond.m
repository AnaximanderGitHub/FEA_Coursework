function [d0,v0,beta,gamma,alpha,A,B,deltaT,Nsteps] = InitCond(t)

% This function sets the initial displacement d0, initial velocity v0,
% Newmark parameters beta and gamma, the integration constant alpha,
% the Rayleigh damping coefficients A and B, timestep size deltaT and 
% number of steps to be used.
  
 gamma  = 1/2;
 beta   = 1/4;

 alpha = 0;
 A     = 0;
 B     = 0;
 
 deltaT = 0.01;
 Nsteps = 2000;
 
 d0  = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0]; 
 v0  = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];  
 
end
