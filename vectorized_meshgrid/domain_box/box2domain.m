function [dom] = box2domain(box)
%BOX2DOMAIN   Convert box to domain description.
%
%usage
%-----
%   dom = box2domain(box)
%
%input
%-----
%   box = pairs of extrema (vectors of the 2 corner points)
%       = [#dim x 2]
%
%output
%------
%   dom = axis extrema (like given to axis)
%       = [1 x (2* #dim) ]
%
%about
%-----
%2013.02.27 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
%See also domain2box, min_bounding_box_aligned, boxdomain, check_domain.

%% input check
[ndim, m] = size(box);

if isempty(box)
    warning('box:empty', 'box matrix is empty.')
end

if m ~= 2
    error('box matrix has more than two columns.')
end

%% convert
dom = reshape(box.', 1, 2*ndim);