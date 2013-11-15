function [aV, mu] = antieig(A)
%ANTIEIG    Antieigenvalues and antieigenvectors.
%   [aV, mu] = ANTIEIG(A) computes the antieigenvectors and antieigenvalues
%   of the non-singular square matrix A. 
%
% usage
%   [aV, mu] = ANTIEIG(A)
%
% input
%   A = square matrix
%     = [n x n]
%
% output
%   aV = antieigenvectors of matrix A
%      = [n x (2*r+1) ], where: r = ceil((n +1) /2)
%   mu = antieigenvalues of matrix A
%      = [1 x r]
%
% reference
%   [1] Gustafson K.E. "The angle of an Operator and Positive Operator
%       Products", Bull. Amer. Math. Soc., 1968, Vol.74, No.3, pp. 488-492
%
%   [2] Gustafson K.E. "A Computational Trigonometry and Related
%       Contributions by Russians Kantorovich, Krein, Kaporin",
%       Journal of Computational Technologies, 1999, Vol.4, No.3, pp. 73-83
%
%   [3] Rao C.R. "Antieigenvalues and Antisingularities of a Matrix and
%       Applications to Problems in Statistics",
%       Res. Lett. Inf. Math. Sci., 2005, Vol.8, pp. 53-76
%
% See also EIG.
%
% File:      antieig.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.07.03
% Language:  MATLAB R2012a
% Purpose:   antieigenvalues and antieigenvectors of square matrix
% Copyright: Ioannis Filippidis, 2012-

%% input
[n, m] = size(A);

% not 2d ?
if n ~= 2
    error('Antieigenvalue computation not yet implemented for >2dim.')
end

% not square ?
if n ~= m
    error('Matrix A is not square.')
end

% not invertible ?
if det(A) == 0
    error('Matrix A is singular.')
end

%% compute
[~, H] = poldec(A);
[V, D] = eig(H);

r = floor(n /2);
mu = nan(1, r);
aV = nan(n, 2*r);
for i=1:r
    k1 = D(i, i);
    x1 = V(:, i);
    
    j = n +1 -i;
    k2 = D(j, j);
    x2 = V(:, j);
    
    a = k1^0.5 /(k1 +k2)^0.5;
    b = k2^0.5 /(k1 +k2)^0.5;
    
    mu(1, i) = 2 *sqrt(k1 *k2) /(k1 +k2); % antieigenvalue
    aV(:, 2*i) = a *x1 +b *x2; % first antieigenvector of pair
    aV(:, 2*i -1) = a *x1 -b *x2; % second antieigenve of pair
end
