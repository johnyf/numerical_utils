function [box] = domain2box(dom)
%DOMAIN2BOX   Convert domain to box description.
%
%usage
%-----
%   box = domain2box(dom)
%
%input
%-----
%   dom = axis extrema (like given to axis)
%       = [1 x (2* #dim) ]
%
%output
%------
%   box = pairs of extrema (vectors of the 2 corner points)
%       = [#dim x 2]
%
%about
%-----
%2012.10.30 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
%See also box2domain, min_bounding_box_aligned, boxdomain, check_domain.

%% input check
[n, m] = size(dom);

if isempty(dom)
    warning('dom:empty', 'domain matrix is empty.')
end

if n ~= 1
    error('domain matrix has more than one rows.')
end

if mod(m, 2) ~= 0
    error('domain matrix has odd number of columns.')
end

ndim = m /2;

%% convert
box = reshape(dom.', 2, ndim).';
