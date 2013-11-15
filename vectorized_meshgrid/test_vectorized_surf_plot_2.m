function [] = test_vectorized_surf_plot_2
% File:      test_vectorized_surf_plot_2.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.01.14 - 
% Language:  MATLAB R2011b
% Purpose:   test meshgrid interface to functions on column vector matrix
% Copyright: Ioannis Filippidis, 2012-

dom = [-1, 1, -1, 1];
res = [31, 30];

[X, Y] = domain2meshgrid(dom, res);
q = meshgrid2vec(X, Y);
f = testf(q);
f = vec2meshgrid(f, X);

surf(X, Y, f)

function [f] = testf(q)
x = q(1, :);
y = q(2, :);

f = x.^3 +y .^3 -6 .*x .*y;
