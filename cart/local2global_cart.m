function [q] = local2global_cart(q, qc, rot)
%LOCAL2GLOBAL_CART  Convert global to local Cartesian coordinates.
%   LOCAL2GLOBAL_CART(q, qc, rot) applies the homogeneous transform
%       T = [rot, qc; zeros(1, 4) ]
%
% usage
%   q = LOCAL2GLOBAL_CART(q, qc, rot)
%
% input
%   q = local coordinates of points
%     = [#dim x #pnts]
%   qc = global coordinates of local origin point
%      = [#dim x 1]
%   rot = rotation matrix around qc (local -> global)
%       = [3 x 3] \in SO(3)
%
% output
%   q_qc = local coordinates of points
%        = [#dim x #pnts]
%
% See also GLOBAL2LOCAL_CART.

% aligned axes ?
if nargin < 3
    ndim = size(q, 1);
    rot = eye(ndim);
end

q = bsxfun(@plus, rot *q, qc);
