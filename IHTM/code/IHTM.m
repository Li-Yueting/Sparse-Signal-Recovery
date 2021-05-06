function [residual,T,V,y0] = IHTM(k,L,CTX,CC,C,x,n,y_k)
% -Func Usage:
%   Recovery measured signal y using iterative hard-thresholding
%   M-sparse algorithm
%
% -Output:
%   residual: error residual of targer signal x after approximation
%   T: indices of computed initial signal y
%   V: values of computed initial signal y
%   y0: initial value of signal y before IHTM
% 
% -Input:
%   k: Sparsity
%   L: 1/L is the gradient stepsize
%   CTX: C'*x
%   CC: C'*C
%   C: Circulant signal measure matrix 
%   x: target signal(named r in 'data_noisefree.mat')
%   n: length of targer signal x
%   y_k: Equals to sum(r)/(k*sum(c))
%   (as in exact solution, sum of initial signal entries = sum(r)/sum(c))
%
%-Reference:
%   Blumensath, T., & Davies, M. E. (2008). Iterative thresholding for 
%   sparse approximations. Journal of Fourier analysis and Applications
%   , 14(5-6), 629-654.

    %% Initialization
    disp('Initialization ...')
    tic
    
    % Random initial y0
    y0=zeros(n,1); 
    idy=randperm(n); 
    y0(idy(1:k))=rand(k,1)*y_k;  
    initial_residual = norm(x-C*y0);
    toc
    
    %% IHTM Iteration
    % Para setting
    iter = 0;
    residual = initial_residual;
    last_residual = 0;
    threshold = 1e-3;
    y_new = y0;
    disp('IHT Iteration ...')
    
    % Iter begin
    while abs(residual-last_residual)> threshold
        iter = iter+1;
        
        % Update initial signal y using gradient
        y = y_new + CTX*(1/L) - CC*y_new*(1/L); 
        
        % Only save biggest k entries of y
        [~,s]=sort(abs(y),'descend'); 
        T=s(1:k); 
        V=y(T);
        y_new=zeros(n,1); 
        y_new(T)=y(T);
        last_residual = residual;
        
        % Compute residual
        residual = norm(x-C*y_new);

        % Disp residual during iteration
        disp(['======sub_iter=====',num2str(iter)])
        disp(['current residual is:',num2str(residual)])
    end
    
    % Disp residual after iteration
    disp(['residual after one iteratoion:',num2str(residual)])   
end