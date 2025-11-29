close all;
clear all functions

 format long;

%%%%%%%%%%%%%%%%%%%%%%
% Pre-processing stage
%%%%%%%%%%%%%%%%%%%%%%

 [M,K,f,yl,W] = Assemble();                                 % Assembles [M], [C], [K] and f
 t = 0.0;                                                   % Initial time t= 0
 [d0,v0,beta,gamma,alpha,A,B,deltaT,Nsteps] = InitCond(t);  % Set initial conditions
 
 C  = A*M+B*K;                                              % Define the Rayleigh damping
 a0 = (inv(M))*(f-(K*d0)-(C*v0));                           % Calculate the initial acceleration
 
 b1 = 1.0/(beta*deltaT*deltaT);                             % Define the integration constant b_1
 b2 = -1.0/(beta*deltaT);                                   % Define the integration constant b_2
 b3 = (2.0*beta-1.0)/(2.0*beta);                            % Define the integration constant b_3
 b4 = gamma/(beta*deltaT);                                  % Define the integration constant b_4
 b5 = 1.0-gamma/beta;                                       % Define the integration constant b_5
 b6 = deltaT*(1.0-gamma/(2.0*beta));                        % Define the integration constant b_6
 
 Kstar = b1*M+(1+alpha)*b4*C+(1+alpha)*K;                   % Compute the effective stiffness matrix Kstar
 Kinv  = inv(Kstar);                                        % Compute the inverse of Kstar
 A1    = b1*M+(1+alpha)*b4*C+alpha*K;                       % Compute the constant matrix A1
 A2    = b2*M+(1+alpha)*b5*C-alpha*C;                       % Compute the constant matrix A2
 A3    = b3*M+(1+alpha)*b6*C;                               % Compute the constant matrix A3
 
 dold  = d0;                                                % Set the value to the old displacement
 vold  = v0;                                                % Set the value to the old velocity
 aold  = a0;                                                % Set the value to the old acceleration
 
 timet(1)  = t;                                             % Store the first step for the time
 disp(1,:) = d0;                                            % Store the first step for the displacement

 nF   = 1;                                                 % Set the storey for the applied force
 [F]  = Load(Nsteps,deltaT,nF);                                % Store the first step for the displacement

%%%%%%%%%%%%%%%%%%
% Processing stage
%%%%%%%%%%%%%%%%%%

 for n = 1:Nsteps

  [f1]  = F(n+1,nF);                                      % Compute the external load at time t+deltaT
  [f2]  = F(n,nF);                                        % Compute the external load at time t
  fstar = (1+alpha)*f1-alpha*f2+A1*dold-A2*vold-A3*aold;  % Compute the effective force fstar
  dnew  = Kinv*fstar;                                     % Update the new displacement
  vnew  = b4*(dnew - dold) + b5*vold + b6*aold;           % Update the new velocity  
  anew  = b1*(dnew - dold) + b2*vold + b3*aold;           % Update the new acceleration
   
  t           = t+deltaT;                                 % Update the time
  timet(n+1)  = t;                                        % Store the time
  disp(n+1,:) = dnew;                                     % Store the displacement
  
  dold = dnew;                                            % Overwrite the old displacement
  vold = vnew;                                            % Overwrite the old velocity
  aold = anew;                                            % Overwrite the old acceleration
  
  DisplaySys(n,yl,W,t,disp);                              % Display dynamics for the system

 end

%%%%%%%%%%%%%%%%%%%%%%%
% Post-processing stage
%%%%%%%%%%%%%%%%%%%%%%%

  figure(2)
  %%%%%%%%%%
  subplot(10,1,1)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,1),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,2)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,2),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,3)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,3),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,4)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,4),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,5)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,5),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,6)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,6),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,7)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,7),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,8)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,8),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,9)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,9),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  set(ax,'xticklabel',[])
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
  subplot(10,1,10)
  %%%%%%%%%%
  ax = gca;
  plot(timet,disp(:,10),'b-','LineWidth',1);
  ax.XAxisLocation = 'origin';
  ax.YAxisLocation = 'origin';
  set(gca,'XMinorTick','on','YMinorTick','on','FontSize',5)
  daspect([1 1 1])
  box off
  axis([0 20 -1 1])
