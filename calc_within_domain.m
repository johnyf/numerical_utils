function [z, varargout] = calc_within_domain(myfun, domain, limits, resolution)
%CALC_WITHIN_DOMAIN     calculate myfun within limits where domain(x) > 0
%
% File:      calc_within_domain.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2010.12.21 - 
% Language:  MATLAB R2010b
% Purpose:   function values within algebraically defined domain
% Copyright: Ioannis Filippidis, 2010-

N = numel(limits) /2;

X = cell(1, N);
for i=1:N
    n = resolution(1, i);
    xmin = limits(2 *(i -1) +1);
    xmax = limits(2 *i);
    X{1, i} = linspace(xmin, xmax, n);
    varargout{i} = X{1, i};
end

%% N=2 (used for most calls, not general but faster)
% also specially arranged for surf (rows <-> y, columns <-> x)
z = zeros(resolution)';
if N == 2
    n1 = resolution(1,1);
    n2 = resolution(1,2);
    for i=1:n1
        for j=1:n2
            x = [X{1, 1}(1, i);
                 X{1, 2}(1, j) ];
            if domain(x)
                z(j, i) = myfun(x);
            else
                z(j, i) = NaN;
            end
        end
    end
    return
end

%% N~=2
z = zeros(resolution);
k = [1, cumprod(resolution(1:end -1) ) ];
indices = ones(1, N);
flag = 1;
while flag
    x = zeros(N, 1);
    for i=1:(N-1)
        x(i, 1) = X{1, i}(1, indices(1, i) );
    end
    
    % iterate over deepest dimension
    n = resolution(1, N);
    for i=1:n
        indices(1, N) = i;
        x(N, 1) = X{1, N}(1, i);
        
        % linear index
        ndx = 1;
        for j=1:N
            v = indices(1, j);
            ndx = ndx + (v-1)*k(j);
        end
        
        % function evaluation
        if domain(x)
            z(ndx) = myfun(x);
        else
            z(ndx) = NaN;
        end
    end
    
    % check if it is not full and increase deepest dimension full, 1 deeper
    flag = 0;
    for i=N:-1:1
        n = resolution(1, i);
        if indices(1, i) < n
            indices(1, i) = indices(1, i) +1;
            for j=(i+1):N
                indices(1, j) = 1;
            end
            flag = 1;
        end
    end
end

z = z';
