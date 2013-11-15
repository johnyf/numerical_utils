function [] = screenshot_normvec
% File:      screenshot_normvec.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.04.17
% Language:  MATLAB R2012a
% Purpose:   generate FEX snapshot for NORMVEC
% Copyright: Ioannis Filippidis, 2012-

ndim = 2;
n = 10;
x = zeros(ndim, n);
%v = [1.5, 1].';
v = 2 *rand(2, n) -1;
v = 2 *v;

ax = newax;
quivermd(ax, x, v, 'LineWidth', 2.5)
hold(ax, 'on')

p = 2;
vn = normvec(v, 'p', p, 'dim', 1);
quivermd(ax, x, vn, 'LineWidth', 5)
