function [d0,v0,deltaT,Nsteps] = InitCond(t)

% This function sets the initial displacement d0, initial velocity v0,
% timestep size deltaT and number of steps to be used.
 
 deltaT = 0.01;
 Nsteps = 5000;
 
 d0  = [0.05; 0.2; 0.2]; 
 v0  = [0;  0;  0];
 
end
