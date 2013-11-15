function [R] = rotzd(angle_deg)
%ROTZD  Rotation around Z-axis by d degrees.
%
% usage
%   R = rotzd(d)
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
% See also rotz.

angle_rad = deg2rad(angle_deg);
R = rotz(angle_rad);
