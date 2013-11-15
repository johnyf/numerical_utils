function [R] = rotxd(angle_deg)
%ROTZD  Rotation around X-axis by d degrees.
%
% usage
%   R = ROTXD(d)
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
% See also rotx.

angle_rad = deg2rad(angle_deg);
R = rotx(angle_rad);