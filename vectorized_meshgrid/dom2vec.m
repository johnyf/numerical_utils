function [varargout] = dom2vec(domain, resolution)
%DOM2VEC    Abbreviated call to domain2vec.
%
% See also domain2vec.
%
% 2012.12.24 (c) Ioannis Filippidis

switch nargout
    case {1, 0}
        q = domain2vec(domain, resolution);
        varargout = {q};
    case 2
        [q, X] = domain2vec(domain, resolution);
        varargout = {q, X};
    case 3
        [q, X, Y] = domain2vec(domain, resolution);
        varargout = {q, X, Y};
    case 4
        [q, X, Y, Z] = domain2vec(domain, resolution);
        varargout = {q, X, Y, Z};
    otherwise
        error('At most 4 output arguments supported.')
end
