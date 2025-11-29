function [F] = Load(Nsteps,deltaT,nF)

% This function computes the load for the 10-storey building.

  mu    = 0;
  sigma = 1;

  F = zeros(Nsteps+1,10); 

  tt = 0;
  for n = 1:Nsteps+1

   Force = 0;                    
   if tt >= 1 & tt <= 3
    Force  = sigma*randn(1,1)+mu;                
   end
   F(n,nF) = 100000*Force;

   tt = tt+deltaT;     

  end  
 
end
