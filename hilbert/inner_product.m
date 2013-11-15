function [p] = inner_product(x, y, gram_matrix)
%INNER PRODUCT  in finite-dim Hilbert space.
%
% usage
%   p = inner_product(x, y, gram_matrix)
%
% input
%   x = vectors: columns of coordinates wrt basis B
%     = [#dim x #vectors]
%   y = as x, same #vectors
%   gram_matrix = matrix defining the inner product wrt basis B
%               = [#dim x #dim]
%
% output
%   p = x.' *A *y (where A = gram_matrix), vector-wise
%     = [1 x #vectors]
%
% 2013.01.23 Copyright Ioannis Filippidis
%
% See also norm_gram, geometric_inversion, ispsd.

% depends
%   ispsd

%% input
if nargin < 3
    A = eye(size(x, 1) );
else
    A = gram_matrix;
end

[ndimx, nx] = size(x);
[ndimy, ny] = size(y);

if ~issquare(A, ndimx)
    error('Gram matrix must be square.')
end

if ~issymmetric(A)
    error('Gram matrix must be symmetric.')
end

if ~ispsd(A)
    error('Gram matrix must be positive-definite.')
end

if ndimx ~= ndimy
    error('dim of x vectors different than dim of y vectors.')
end

if nx ~= ny
    error('number of x vectors does not match that of y vectors.')
end

%% calc
p = dot(x, A*y);
