function [X, Y, Z] = dom2grid(domain, resolution)
% shorthand for domain2meshgrid
%
% For details see domain2meshgrid
%
%about
%-----
% 2013.05.14 (c) Ioannis Filippidis
% See also domain2meshgrid.

switch nargout
    case {0, 1}
        X = domain2meshgrid(domain, resolution);
    case 2
        [X, Y] = domain2meshgrid(domain, resolution);
    case 3
        [X, Y, Z] = domain2meshgrid(domain, resolution);
    otherwise
        error('At most 3 output arguments supported.')
end     
