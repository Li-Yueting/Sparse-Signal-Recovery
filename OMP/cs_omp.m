function [x_c_value,x_c_index] = cs_omp(data, rho, alpha)
%% load data
load(data);
r = [real(r); imag(r)];
n = length(c);
mul = zeros(2*n,1);
threshold = rho*norm(r);

% preallocate space for store nonzero x(assume max sparsity:50)
x_index = zeros(50,1);
x_value = zeros(50,1);

%% OMP iteration
iter = 0;
tic
while norm(r)>threshold
    iter = iter + 1;
    for i = 1:n
    mul(i)= r'*[circshift(real(c),i-1); circshift(imag(c),i-1)];
    end
    for i = n+1:2*n
        mul(i)= r'*[-circshift(imag(c),i-n-1);circshift(real(c),i-n-1)];
    end
    
    % find max atom projection of circulant C on r; 
    [value,index] = max(mul);
    if index<=n
        atom = [circshift(real(c),index-1); circshift(imag(c),index-1)];
    else
        atom = [-circshift(imag(c),index-n-1);circshift(real(c),index-n-1)];
    end
    % if atom was used, disp info
    if ismember(index,x_index)==1
        disp('repeated atoms');
    end
    x_index(iter) = index;
    x_value(iter) = alpha*value;
    % extract twice of atom projection times atom from r; 
    r = r - alpha*value*atom;
%     r = r - (r'*r)/value*atom;
    disp('norm of r residual:');
    disp(norm(r));
end
toc

% neat x in complex form
x_index(x_index==0)=[];
x_value(x_value==0)=[];
x_c_index = zeros(length(x_index),1);
x_c_value = zeros(length(x_index),1);
for i=1:length(x_index)
    index = x_index(i);
    value = x_value(i);
    if index<=n
        x_c_value(i) = x_c_value(i) + value;
        x_c_index(i) = index;
    else
        x_c_value(i) = x_c_value(i) + 1j*value;
        x_c_index(i) = index-n;
    end
end
end
