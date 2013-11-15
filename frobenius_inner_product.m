function [x] = frobenius_inner_product(A, B)
% calculates sum(sum(A .*B) ) = trace(A' *B) = <A, B>_{Frobenius}
%
%usage
%-----
%   x = frobenius_inner_product(A, B)
%
%input
%-----
%   A = [n x m] matrix
%   B = [n x m] matrix
%
%output
%------
%   x = trace(A' *B)
%
%about
%-----
%   2013.05.26 (c) Ioannis Filippidis, jfilippidis@gmail.com
%   See also inner_product, dot, norm

x = sum(sum(A .*B) );
