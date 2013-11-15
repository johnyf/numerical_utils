function [p] = ispsd(A)
%ISPSD  Check for positive-definiteness.
%
% usage
%   ispsd = ISPSD(A)
%
% input
%   A = matrix (need not be symmetric,
%               remember though that only symmetric part determines
%               sign-definiteness, anti-symmetric/symplectic part is
%               conservative, i.e., Hamiltonian)
%
% output
%   ispsd = 1:if positive-definite | 0:otherwise
%
% tip
%   use ispsd(-A) to check for negative definiteness
%
% 2013.01.23 (c) Ioannis Filippidis
%
% See also check_psd, chol.

if ~issquare(A)
    p = 0;
    return
end

if ~issymmetric(A)
    warning('Checking for PSD matrix which is not symmetric.')
end

if exist('chol', 'file') && (exist('OCTAVE_VERSION') == 0)
    [tilde, notpsd] = chol(A);
    p = ~notpsd;
else
    % do it the hard way
    % (testing with Freemat, which does not have chol)
    if ~all(eig(A) >= 0)
        p = 0;
    else
        p = 1;
    end
end
