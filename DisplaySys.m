function DisplaySys(L,t,dnew)

% This function Displays the dynamics for the system.

  XP0  = 0;
  YP0  = 2*L;
  
  XP1   = dnew(1);
  YP1   = YP0-sqrt(L^2-(XP0-XP1)^2);
    
  XP2   = dnew(2);
  YP2   = YP1-sqrt(L^2-(XP1-XP2)^2);
    
  XP3   = dnew(3);
  YP3   = YP2-sqrt(L^2-(XP2-XP3)^2);

  fh = figure(1)
  clf
  
  plot([0 0],[-1.1*L 2*L],'b:','LineWidth',1)
  hold on 
  plot(XP1,YP1,'ko','MarkerFaceColor','k','MarkerSize', 10)
  plot(XP2,YP2,'ko','MarkerFaceColor','k','MarkerSize', 15)
  plot(XP3,YP3,'ko','MarkerFaceColor','k','MarkerSize', 20)
  plot([0 XP1],[2*L YP1],'k-')
  plot([XP2 XP1],[YP2 YP1],'k-')
  plot([XP3 XP2],[YP3 YP2],'k-')
  axis([-0.3 0.3 -1.1*L 2*L])
  title(['t = ',num2str(t,'%4.2f'),' s'],'fontSize',13)
  grid minor
  pause(0.0001)
 
end
