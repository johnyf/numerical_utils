function [q] = local_pol2global_cart(theta, rho, qc)
q = vpol2cart(theta, rho);
q = local2global_cart(q, qc);
% although the parameterization is discontinuous,
% the object is not, hence the functions are continuous
