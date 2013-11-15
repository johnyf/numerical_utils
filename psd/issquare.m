function [yesno] = issquare(A, n)
%ISSQUARE  Check if matrix is square (only for 2d matrices).
%
% usage
%   yesno = ISQUARE(A, n)
%
% input
%   A = matrix
%
% optional input
%   n = size of matrix to check if it is square AND [n x n]
%     \in\naturals
%
% output
%   yesno = square or not
%         = 1:if square | 0:otherwise
%
% 2013.01.23 Copyright Ioannis Filippidis

if nargin < 2
    n = size(A, 1);
end

if ~ismatrix(A)
    disp('Non-matrix A cannot be square.')
    yesno = 0;
    return
end

sz = size(A);
if (sz(1) ~= sz(2) ) || (sz(1) ~= n)
    yesno = 0;
else
    yesno = 1;
end
