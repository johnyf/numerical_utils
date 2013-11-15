function [z] = origin(ndim)
% File:      origin.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2011.04.21 - 
% Language:  MATLAB R2012a
% Purpose:   zero column vector of appropriate dimension
% Copyright: Ioannis Filippidis, 2011-

if nargin < 1
    ndim = 3;
end

z = zeros(ndim, 1);
