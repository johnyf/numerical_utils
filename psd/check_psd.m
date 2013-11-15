function [] = check_psd(A)
%CHECK_PSD  Check if matrix is positive-definite, error otherwise.
%
% usage
%   CHECK_PSD(A)
%
% input
%   A = matrix
%
% 2013.01.23 Copyright Ioannis Filippidis
%
% See also ispsd, chol, inner_product.

% depends
%   ispsd

if ispsd(A)
    return
end

disp(A)
error('The above matrix is not positive-definite.')
