function [L] = norm_gram(x, gram_matrix)
%NORM_GRAM  Norm induced by inner product defined by Gram matrix.
%
% usage
%   m = norm_gram(x, gram_matrix)
%
% input
%   x = vectors: columns of coordinates wrt basis B
%     = [#dim x #vectors]
%   y = as x, same #vectors
%   gram_matrix = matrix defining the inner product wrt basis B
%               = [#dim x #dim]
%
% output
%   p = sqrt(x.' *A *x) (where A = gram_matrix), vector-wise
%     = [1 x #vectors]
%
% 2013.01.23 Copyright Ioannis Filippidis
%
% See also inner_product, geometric_inversion, ispsd.

%% input
if nargin < 2
    gram_matrix = eye(size(x, 1) );
end

%% calc
L = sqrt(inner_product(x, x, gram_matrix) );
