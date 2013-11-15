function [resolution] = res2meshsize(resolution)
% RES2MESHSIZE  Convert resolution [nx, ny, nz] to meshgrid matrix
%               dimensions, i.e., [ny, nx, nz].
%
% See also VSURF, POLAR_DOMAIN2VEC, PLOT_MAPPING.
%
% File:      res2meshsize.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.25
% Language:  MATLAB R2012a
% Purpose:   Convert domain resolution to meshgrid matrix size
% Copyright: Ioannis Filippidis, 2012-

% which resolution ?
if size(resolution, 2) < 3
    % flip only for 2D
    resolution = fliplr(resolution);
else
    % flip only if X, Y from 2D
    if resolution(1, 3) == 1
        resolution = resolution(1, 1:2);
        resolution = fliplr(resolution);
    elseif resolution(1, 1) == 1
        resolution = resolution(1, 2:3);
    elseif resolution(1, 2) == 1
        resolution = resolution(1, [1, 3] );
    else
        warning('vmeshgrid:resolution', '3d resolution for 2d surface.')
    end
end
