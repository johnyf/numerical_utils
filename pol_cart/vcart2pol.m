function [theta, rho, z] = vcart2pol(q)
% vectorized cartesian to polar coordinates transformation.
%
% See also VPOL2CART.

ndim = size(q, 1);

if ndim < 2
    error('vcart2pol:dim', 'Vector dimension less than 2.')
elseif ndim == 2
    [theta, rho] = cart2pol(q(1, :), q(2, :) );
else
    [theta, rho, z] = cart2pol(q(1, :), q(2, :), q(3, :) );
end
