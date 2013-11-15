function c = numpages(m)
%NUMPAGES Return number of pages in matrix.
%   NC = NUMPAGES(M) returns the number of pages in the matrix M.
%   This equals the size of the 3rd dimension of M, i.e., size(M, 3).
%
% See also NUMCOLS, NUMROWS.

c = size(m, 3);
