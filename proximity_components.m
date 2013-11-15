function [node_component_id, A] = proximity_components(x, r)
%PROXIMITY_COMPONENTS   Connected components of mobile network.
%
% usage
%   [node_component_id, A] = PROXIMITY_COMPONENTS(x, r)
%
% input
%   x = node point coordinates
%     = [#dim x #nodes]
%   r = communication radii for nodes
%     = [1 x #nodes] | scalar
%
% output
%   node_component_id = id of connected component each node belongs to
%                     = [1 x #nodes]
%   A = adjacency matrix
%     = [#nodes x #nodes]
%
% File:      proximity_components.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.08.13
% Language:  MATLAB R2012a
% Purpose:   given node points and a communication distance, find the
%            connected component to which each node belongs
% Copyright: Ioannis Filippidis, 2012-

% depends
%   vdistance, scomponents

d = vdistance(x, x);
A = bsxfun(@lt, d, r);
node_component_id = scomponents(A).';
