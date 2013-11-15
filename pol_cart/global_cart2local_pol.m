function [theta, r] = global_cart2local_pol(x, xc)
x_xc = global2local_cart(x, xc);
[theta, r] = vcart2pol(x_xc);
% although the parameterization is discontinuous,
% the object is not, hence the functions are continuous
