function [v] = omit(i, n)
% Omit value i from either set 1:n of indices,
% or the provided set n (if n is an array).
%
% usage
%   v = OMIT(i, n)
%
% input
%   i = value to omit
%   n = scalar to count from 1:n, or array from which to remove i
%     \in \naturals
%     |= [1 x #elements]
%
% output
%   v = [1:(i-1), (i+1):n] (if isscalar(n) )
%    |= n\setminus i
%
% 2013.02.02 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also setdiff, unique.

if isscalar(n)
    v = [1:(i-1), (i+1):n];
elseif isvector(n)
    v = setdiff(n, i);
else
    error('n is neither a scalar, nor a vector.')
end