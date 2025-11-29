function [Edisp] = ExactSol(t,L,Lambda,omega,x)

% This function computes the exact solution for the system.
 
 Edisp  = (cosh(Lambda*x)-cos(Lambda*x)-(cos(Lambda*L)+cosh(Lambda*L))...
    /(sin(Lambda*L)+sinh(Lambda*L))*(sinh(Lambda*x)-sin(Lambda*x))).*cos(omega*t);
 
end
