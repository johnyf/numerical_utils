function [yesno] = anymember(A, B)
%ANYMEMBER  Checks if A \cap B == \emptyset
%
% usage
%   yesno = ANYMEMBER(A, B)
%
% input
%   A, B = sets
%
% output
%   yesno = true: A \cap B ~= \emptyset (have common elements)
%         | false: A \cap B == \emptyset (empty intersection)
%
% 2013 Copyright Ioannis Filippidis

yesno = any(ismember(A, B) );
