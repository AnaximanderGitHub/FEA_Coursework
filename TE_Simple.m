      close all;
      clear all functions;
%
%   define range of x values (be sure to stay within the radius of convergence)
%
      x  = linspace(0,5,100);
%
%   loop over terms in expansion
%
      maxT = 9;                            % number of terms used in expansion
      T = 1;  f = T;                       % initialize series
      for n=1:maxT
        r       = x./n;                    % compute r (this is usually a function of n)
        T       = r.*T;                    % compute Tn+1
        f       = f+T;                     % add Tn+1 to partial sum
      end
%
%   plot results
%
      figure(1)
      plot(x,exp(x),'k-','LineWidth',2)
      hold on
      plot(x,f,'b--','LineWidth',2)
      
      title(['Evaluating TE Series of exp (n = ',num2str(maxT), ')']); 
      xlabel('x'),
      ylabel('f(x)')
      legend('Exact','TE Series')  
%
%   end of program
%






