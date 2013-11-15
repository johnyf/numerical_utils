function [dom] = boxdomain(ndim, sideL)
%BOXDOMAIN  Create a (hyper)cube, compatible with axes().
%
% usage
%   dom = BOXDOMAIN % unit hypercube
%   dom = BOXDOMAIN(n, sideL)
%
% input
%   ndim = space dimension
%        \in\naturals
%   sideL = cube's sides' length
%         > 0 [default = 1]
%
% output
%   dom = cube domain in format compatible with axes()
%       = [1 x (2*#dim) ] = [xmin, xmax, ymin, ymax, ... ]
%       = [-L, L, -L, L, ... ], where: L = sideL
%
% 2012.11.16 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also axes, domain2vec, surf, check_domain, box2domain.

if nargin < 1
    ndim = 2;
    disp('No (hyper)cube dimension given, using: dim = 2')
end

% unit side length
if nargin < 2
    sideL = 1;
    disp('No (hyper)cube side length given, using: sideL = 1.')
end

I = ones(1, ndim);
dom = [I; -I];
dom = reshape(dom, 1, 2*ndim);

dom = sideL .*dom;
