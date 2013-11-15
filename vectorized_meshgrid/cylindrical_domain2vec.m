function [q, X, Y, Z, u, Theta, Rho] = cylindrical_domain2vec(domain, resolution, qc)
%CYLINDRICAL_DOMAIN2VEC     Cylindrical domain to Cartesian points.
%
% usage
%   [q, X, Y, Z, u, Theta, Rho] = CYLINDRICAL_DOMAIN2VEC(domain, resolution, qc)
%
% input
%   domain = cylindrical grid coordinate extrema
%          = [theta_min, theta_max, rho_min, rho_max, z_min, z_max]
%   resolution = number of grid points per dimension
%              = [n_theta, n_rho, n_z]
%   qc = pole coordinate vector (cylindrical coordinate system center)
%      = [3 x 1] = [xc, yc, zc].'
%
% output
%   q = position vectors of grid points in Cartesian coordinates
%     = [3 x #points] = [x; y; z], where #points = prod(resolution)
%   X = abscissas of grid points
%     = [resolution(1) x resolution(3) ]
%   Y = ordinates of grid points
%     = [resolution(1) x resolution(3) ]
%   Z = applicates of grid points
%     = [resolution(1) x resolution(3) ]
%   u = position vectors of grid points in cylindrical coordinates
%     = [3 x #points] = [theta; rho; z]
%   Theta = angles of grid points
%         = [resolution(1) x resolution(3) ]
%   Rho = polar radii of grid points
%       = [resolution(1) x resolution(3) ]
%
% See also POLAR_DOMAIN2VEC, DOMAIN2VEC, CYL2CART.
%
% File:      cylindrical_domain2vec.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.26
% Language:  MATLAB R2012a
% Purpose:   Convert cylindrical domain & resolution to cylindrical grid
%            expressed in Cartesian coordinates
% Copyright: Ioannis Filippidis, 2012-

% depends
%   domain2vec, vpol2cart, res2meshsize, vec2meshgrid

% default pole ?
if nargin < 3
    qc = zeros(3, 1);
end

% dim ok ?
ndim1 = size(domain, 2) /2;
ndim2 = size(resolution, 2);
ndim = size(qc, 1);
if (ndim ~= ndim1) || (ndim ~= ndim2)
    error('domain2vec:dim', ['Dimensions of: domain, resolution, qc do',...
          ' not agree with each other.'] )
end

%% calc
[u, Theta, Rho, Z] = domain2vec(domain, resolution);

q = vpol2cart(u(1,:), u(2,:), u(3,:) );
q = bsxfun(@plus, q, qc);

res = res2meshsize(resolution);

[X, Y] = vec2meshgrid(q, [], res);
