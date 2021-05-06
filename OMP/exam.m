function [] = exam(data,x_value,x_index)
load(data);
r_cur = zeros(length(r),1);
m = length(x_index);

for i=1:m
    index = x_index(i);
    % cooresponding atom of Circulant C
    atom = circshift(c,index-1);
    r_cur = r_cur + x_value(i)*atom;
end
r_residual = r - r_cur;
error = norm(r_residual)/norm(r);
disp('Error In Percentage:');
disp([num2str(100*error),'%']);
end

