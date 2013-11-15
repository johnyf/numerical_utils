function [f] = ftrim(f, threshold)
%FTRIM  Trim function at threshold to NaN.
%
% usage
%   g = ftrim(f, threshold)
%
% input
%   f = function values
%   threshold = scalar value where to trim, or matrix [min, max]
%             = abs_max | [min, max]
%
% output
%   f = trimmed function (NaN replaced values outside specified thresholds)
%
% note
%   useful to trim surfaces and generally plots
%
% 2013.01.25 Copyright Ioannis Filippidis
%
% See also remnan.

if isscalar(threshold)
    f(abs(f) > threshold) = nan;
elseif ismatrix(threshold)
    fmin = threshold(1);
    fmax = threshold(2);
    
    f(f < fmin) = nan;
    f(f > fmax) = nan;
end
