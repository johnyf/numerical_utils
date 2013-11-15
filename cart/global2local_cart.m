function [q_qc] = global2local_cart(q, qc, rot)
%GLOBAL2LOCAL_CART  Convert global to local Cartesian coordinates.
%   GLOBAL2LOCAL_CART(q, qc, rot) applies the homogeneous transform
%       T = [rot.', -qc; zeros(1, 4) ]
%
% usage
%   q_qc = GLOBAL2LOCAL_CART(q, qc, rot)
%
% input
%   q = global coordinates of points
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
% See also LOCAL2GLOBAL_CART.

% aligned axes ?
if nargin < 3
    ndim = size(q, 1);
    rot = eye(ndim);
end

q_qc = rot.' *bsxfun(@minus, q, qc);
