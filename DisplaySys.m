function DisplaySys(step,yl,W,t,disp) 

% This function Displays the dynamics for the system.

 fh = figure(1);
 clf
 axis([-10 25 0 31])
 daspect([1 1 1])
 axis off
 %%%%%%%%%
 hold on
 plot([0 disp(step+1,1)],[yl(1) yl(2)],'k-','LineWidth',5)
 plot([disp(step+1,1)-0.3 W+disp(step+1,1)+0.3],[yl(2) yl(2)],'k-','LineWidth',5)
 plot([W+disp(step+1,1) W],[yl(2) yl(1)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,1) disp(step+1,2)],[yl(2) yl(3)],'k-','LineWidth',5)
 plot([disp(step+1,2)-0.3 W+disp(step+1,2)+0.3],[yl(3) yl(3)],'k-','LineWidth',5)
 plot([W+disp(step+1,2) disp(step+1,1)+W],[yl(3) yl(2)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,2) disp(step+1,3)],[yl(3) yl(4)],'k-','LineWidth',5)
 plot([disp(step+1,3)-0.3 W+disp(step+1,3)+0.3],[yl(4) yl(4)],'k-','LineWidth',5)
 plot([W+disp(step+1,3) disp(step+1,2)+W],[yl(4) yl(3)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,3) disp(step+1,4)],[yl(4) yl(5)],'k-','LineWidth',5)
 plot([disp(step+1,4)-0.3 W+disp(step+1,4)+0.3],[yl(5) yl(5)],'k-','LineWidth',5)
 plot([W+disp(step+1,4) disp(step+1,3)+W],[yl(5) yl(4)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,4) disp(step+1,5)],[yl(5) yl(6)],'k-','LineWidth',5)
 plot([disp(step+1,5)-0.3 W+disp(step+1,5)+0.3],[yl(6) yl(6)],'k-','LineWidth',5)
 plot([W+disp(step+1,5) disp(step+1,4)+W],[yl(6) yl(5)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,5) disp(step+1,6)],[yl(6) yl(7)],'k-','LineWidth',5)
 plot([disp(step+1,6)-0.3 W+disp(step+1,6)+0.3],[yl(7) yl(7)],'k-','LineWidth',5)
 plot([W+disp(step+1,6) disp(step+1,5)+W],[yl(7) yl(6)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,6) disp(step+1,7)],[yl(7) yl(8)],'k-','LineWidth',5)
 plot([disp(step+1,7)-0.3 W+disp(step+1,7)+0.3],[yl(8) yl(8)],'k-','LineWidth',5)
 plot([W+disp(step+1,7) disp(step+1,6)+W],[yl(8) yl(7)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,7) disp(step+1,8)],[yl(8) yl(9)],'k-','LineWidth',5)
 plot([disp(step+1,8)-0.3 W+disp(step+1,8)+0.3],[yl(9) yl(9)],'k-','LineWidth',5)
 plot([W+disp(step+1,8) disp(step+1,7)+W],[yl(9) yl(8)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,8) disp(step+1,9)],[yl(9) yl(10)],'k-','LineWidth',5)
 plot([disp(step+1,9)-0.3 W+disp(step+1,9)+0.3],[yl(10) yl(10)],'k-','LineWidth',5)
 plot([W+disp(step+1,9) disp(step+1,8)+W],[yl(10) yl(9)],'k-','LineWidth',5)
 %%
 plot([disp(step+1,9) disp(step+1,10)],[yl(10) yl(11)+0.15],'k-','LineWidth',5)
 plot([disp(step+1,10)-0.3 W+disp(step+1,10)+0.3],[yl(11) yl(11)],'k-','LineWidth',5)
 plot([W+disp(step+1,10) disp(step+1,9)+W],[yl(11) yl(10)],'k-','LineWidth',5)

 text(2,30.3,['t = ',num2str(t,'%3.2f'),' s'],'fontSize',11)
 pause(0.0001)
 
end
