function preprocess(data)
% -Func Usage:
%   Preprocess and save data for later ease
 
    % Load data
    load(data);
    n = length(c);
    x = r;
    
    % Circulant C
    C = zeros(n,n);
    tic
    for i=1:n
        C(:,i)=circshift(c,i-1);
    end
    
    % CC(C'*C)
    CC = C'*C;
    
    % CTX(C'*x)
    CTX = C'*x; 
    
    % Save data 
    save('CC.mat','CC','-v7.3');
    save('C.mat','C','-v7.3');
    save('CTX.mat','CTX','-v7.3')
    toc
end