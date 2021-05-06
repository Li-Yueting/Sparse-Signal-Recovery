
% - Usage:
%   Because the effect iterative hard-thresholding M-sparse algorithm 
%   depends much on initial y0 value, we randomly assign y0 for 
%   total_iter times and keep the most approxinate signal recovery result
% 
% -Input:
%   k: Sparsity
%   L: 1/L is the gradient stepsize
%   Total_iter: Times of randomly assigning y0 and using IHTM

%% Load preprocessed data(load codes can be removed after first run)
CTX=load('CTX.mat','CTX').CTX;
CC=load('CC.mat','CC').CC;
C=load('C.mat','C').C;
x=load('data_noisefree.mat','r').r;
c=load('data_noisefree.mat','c').c;

%% Main Para Setting(pls set them properly before running!)
k = 6; %spasity
L = 10; %inverse of gradient stepsize
total_iter = 100; %total main iteration times 

%% Initialization of other para 
% y_k: Equals to sum(r)/(k*sum(c))
% (In exact solution, sum of initial signal y entries = sum(r)/sum(c))
y_k=sum(x)/(sum(c)*k);
n=length(x);
count = 0; 

% Initial least residual set to inf
least_residual = inf;
sparseYindex = zeros(k,1);
sparseYvalue = zeros(k,1);

%% Iterations
while count<total_iter
    count = count+1;
    disp(['random process:',num2str(count)])

    % Every iter using IHTM func
    [cur_residual,cur_index,cur_value,cur_y0]=IHTM(k,L,CTX,CC,C,x,n,y_k);

    % Save least residual info(residual, y index, y value)
    if cur_residual<least_residual
        least_residual = cur_residual;
        sparseYindex = cur_index;
        sparseYvalue = cur_value;
        y0 = cur_y0;
    end
end

%% Disp final result 
disp(least_residual)
disp(sparseYindex)
disp(sparseYvalue)
save('sparsity.mat','least_residual','sparseYindex','sparseYvalue','y0')

%% Email notice
% mail2me('test',['least_residual is...',num2str(least_residual),'spasity is...',num2str(k)],'sparsity.mat')

