function [q] = vpol2cart(theta, rho, z)
%VCART2POL  Vectorized polar to cartesian coordinate transformation.
%
% See also VCART2POL.

[x, y] = pol2cart(theta, rho);

if nargin < 3
    q = [x; y];
elseif nargin == 3
    q = [x; y; z];
end
