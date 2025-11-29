close all;
clear all functions

% This codes solve a 2DoF system for the Beat phenomenon
% using the central difference method

%
% Pre-processing stage
%

 [M,K,C,f,L] = Assemble();                   % Assembles [M], [C], [K] and f

 t = 0;

 [d0,v0,deltaT,Nsteps] = InitCond(t);        % Set initial conditions

 
  a0    = (inv(M))*(f-(K*d0)-(C*v0));        % Calculate the initial acceleration
  d_m1  = d0-(v0*deltaT)+(a0*(deltaT^2)/2);  % Calculate the displacement at time t = -deltaT
  
  dmold = d_m1;                              % Set the value to the old displacement at time t = -deltaT
  dold  = d0;                                % Set the value to the old displacement
  
  timet(1)  = t;                             % Store the first step for the time
  disp(1,:) = d0;                            % Store the first step for the displacement
  
  Kstar = ((1/(deltaT^2))*M)+((1/(2*deltaT))*C);      % Compute the effective stiffness matrix Kstar
  Kinv  = inv(Kstar);                                 % Compute the inverse of Kstar
  A1    = (K-((2/(deltaT^2))*M));                     % Compute the constant matrix A1
  A2    = (((1/(deltaT^2))*M)-((1/(2*deltaT))*C));    % Compute the constant matrix A2

%
% Processing stage
%

 for n = 1:Nsteps
 
  fstar = f-(A1*dold)-(A2*dmold);   % Compute the effective force fstar
  dnew  = Kinv*fstar;               % Update the new displacement
 
  t     = t+deltaT;                 % Update the time
  
  timet(n+1)  = t;                  % Store the time
  disp(n+1,:) = dnew;               % Store the displacement
  
  dmold      = dold;                % Overwrite the old displacement at time t = -deltaT
  dold       = dnew;                % Overwrite the old displacement
  
  DisplaySys(L,t,dnew)              % Display dynamics for the system.
  
 end

%
% Post-processing stage
%

  figure(2)
  %%%%%%%%%%
  plot(timet,disp(:,1),'b-','LineWidth',1);
  xlabel('Time t');
  ylabel('Displacement u_1')
  title(['\Delta t = ',num2str(deltaT,'%4.3f'),' s'])

  figure(3)
  %%%%%%%%%%
  plot(timet,disp(:,2),'r-','LineWidth',1);
  xlabel('Time t');
  ylabel('Displacement u_2')
  title(['\Delta t = ',num2str(deltaT,'%4.3f'),' s'])

  figure(4)
  %%%%%%%%%%
  plot(timet,disp(:,3),'m-','LineWidth',1);
  xlabel('Time t');
  ylabel('Displacement u_3')
  title(['\Delta t = ',num2str(deltaT,'%4.3f'),' s'])
