function [q, X, Y, u, Theta, Rho] = polar_domain2vec(domain, resolution, qc)
%POLAR_DOMAIN2VEC   Polar domain to Cartesian coordinate vectors.
%
% usage
%   [q, X, Y, u, Theta, Rho] = POLAR_DOMAIN2VEC(domain, resolution, qc)
%
% input
%   domain = polar coordinate extrema
%          = [theta_min, theta_max, rho_min, rho_max]
%   resolution = number of grid points per dimension
%              = [n_theta, n_rho]
%   qc = pole coordinate vector (polar coordinate system center)
%      = [2 x 1] = [xc, yc].'
%
% output
%   q = position vectors of grid points in Cartesian coordinates
%     = [2 x #points] = [x; y], where #points = prod(resolution)
%   X = abscissas of grid points
%     = [resolution(2) x resolution(1) ]
%   Y = ordinates of grid points
%     = [resolution(2) x resolution(1) ]
%   u = position vectors of grid points in polar coordinates
%     = [2 x #points] = [theta; rho]
%   Theta = angles of grid points
%         = [resolution(2) x resolution(1) ]
%   Rho = polar radii of grid points
%       = [resolution(2) x resolution(1) ]
%
% See also CYLINDRICAL_DOMAIN2VEC, DOMAIN2VEC, VPOLAR2CART.
%
% File:      polar_domain2vec.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.25
% Language:  MATLAB R2012a
% Purpose:   Convert polar domain & resolution to polar grid expressed in
%            Cartesian coordinates
% Copyright: Ioannis Filippidis, 2012-

% depends
%   domain2vec, vpol2cart, res2meshsize, vec2meshgrid

%% input

% default pole ?
if nargin < 3
    qc = zeros(2, 1);
end

% dim ok ?
ndim1 = size(domain, 2) /2;
ndim2 = size(resolution, 2);
ndim = size(qc, 1);
if (ndim ~= ndim1) || (ndim ~= ndim2)
    error('domain2vec:dim', ['Dimensions of domain, resolution, qc do',...
          ' not agree with each other.'] )
end

%% calc
[u, Theta, Rho] = domain2vec(domain, resolution);

q = vpol2cart(u(1,:), u(2,:) );
q = bsxfun(@plus, q, qc);

res = res2meshsize(resolution);

[X, Y] = vec2meshgrid(q, [], res);
