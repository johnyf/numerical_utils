function [x] = input_matrix(xsize)
% File:      input_matrix.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2011.03.09 - 
% Language:  MATLAB R2010b
% Purpose:   asks user to input a matrix
% Copyright: Ioannis Filippidis, 2010-

x = [];
while ~isequal(size(x), xsize)
    x = input( ['  ', num2str(xsize), 'array:'] );
    
    if isempty(x)
        return
    end
end
