function [] = matrix_multiplication_3d
% File:         matrix_multiplication_3d.m
% Author:       Ioannis Filippidis, jfilippidis@gmail.com
% Date:         2009.05.14 - 2010.01.20
% Language:     MATLAB R2010a
% Purpose:      Multi-Dimensional Matrix Product
% Copyright:    Ioannis Filippidis, 2009-

% testdata
x = rand(2, 2, 10);
y = rand(2, 2, 10);

% the loop
z1 = zeros(2,2,10);
for i=1:10
  z1(:,:,i) = x(:,:,i)*y(:,:,i);
end

% vectorized version
zCell = arrayfun(@(ind) x(:,:,ind)*y(:,:,ind), 1:size(x,3), 'uniformOutput',false);
z2 = cat(3, zCell{:});

% test
isequal(z1, z2)

% the fast way
c = multiprod(x,y);

% test
isequal(z1, c)
