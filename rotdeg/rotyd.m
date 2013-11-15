function [R] = rotyd(angle_deg)
%ROTYD  Rotation around Y-axis by d degrees.
%
% usage
%   R = ROTYD(d)
%
% input
%   d = angle [degrees]
%
% output
%   R = rotation matrix
%     \in SO(3)
%
% 2012.12.05 - Copyright: Ioannis Filippidis
%
% See also roty.

angle_rad = deg2rad(angle_deg);
R = roty(angle_rad);