%
%   TE_Sinh   Evaluation of Taylor Series Expansions
%
%   This code simply illustrates how to evaluate an infinite series
%   expansion for a particular function, f(x). The key here is to 
%   write the series as a simple recurrence relation, with term 
%   Tn+1 written as a function of term Tn (see the notes for details).
%

%
%   getting started
%
      close all;
      clear all functions;
%
%   define range of x values (be sure to stay within the radius of convergence)
%
      x  = linspace(0,5,100);
%
%   loop over terms in expansion
%
      maxT = 10;  tol = 1e-6;   n = 1;  rerr = 1.0;
      T = x;  f = T;                   % initialize series
      while rerr > tol  &  n < maxT
        r = x.*x/((2*n+1)*2*n);        % compute r  (this is usually a function of n)
        T = r.*T;                      % compute Tn+1
        f = f + T;                     % add Tn+1 to partial sum
        rerr = max(abs(T./f));         % compute max relative error
        n = n+1;                       % increment counter
      end
      NT = n;                          % number of terms used in expansion
%
%   plot results
%
      figure(1)
      plot(x,sinh(x),'k-','LineWidth',2)
      hold on
      plot(x,f,'b--','LineWidth',2)
      grid
      title(['Evaluating TE Series of sinh (n = ',num2str(NT), ')']); 
      xlabel('x'),
      ylabel('f(x)')
      legend('Exact','TE Series')       
%
%   end of program      
%