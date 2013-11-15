function [ei] = ei_vector(i, n)
%unit vector with zeros except for the i^th element.
%
%usage
%-----
%   ei = ei_vector(i, n)
%
%input
%-----
%   i = index of element equal to 1.
%   n = vector dimension
%
%output
%------
%   ei = column vector of unit 1-,2-,\infty-norm with i-th element 1
%      = [0, ..., 0, 1, 0, ..., 0].'
%
%about
%-----
%2012.08.15 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also eye, zeros.

ei = [zeros(1, i-1), eye(1, n-i+1) ].';
