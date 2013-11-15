function [domain] = check_domain(domain, auto_domain)
%CHECK_DOMAIN   subset relation of parallelepiped domains.
%   check that auto_domain \subseteq domain
%
%usage
%-----
%   domain = check_domain(domain, auto_domain)
%
%input
%-----
%   domain = [x1_min, x1_max, x2_min, x2_max, ..., xN_min, xN_max]
%   auto_domain = [x1_min, x1_max, x2_min, x2_max, ..., xN_min, xN_max]
%
%output
%------
%   domain = [x1_min, x1_max, x2_min, x2_max, ..., xN_min, xN_max]
%
%about
%-----
%2011.11.13 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
%See also boxdomain, domain2box, box2domain, min_bounding_box_aligned

disp(['domain = [', num2str(domain, 3), ']'] )
disp(['auto_domain = [', num2str(auto_domain, 3), ']'] )

if size(domain, 1) ~= 1
    error('size(domain, 1) ~= 1')
end

if size(auto_domain, 1) ~= 1
    error('size(auto_domain, 1) ~= 1')
end

ndim1 = size(domain, 2) /2;
ndim2 = size(auto_domain, 2) /2;

if ndim1 ~= ndim2
    error('Number of dimensions different between domain and auto_domain')
end
ndim = ndim1;

%% check auto_domain \subseteq domain
flag = false;
for i=1:ndim
    endpoints = [2*i-1, 2*i];
    interval1 = auto_domain(1, endpoints);
    interval2 = domain(1, endpoints);
    if ~issubinterval(interval1, interval2)
        warning('nflearn:domain', 'auto_domain \notsubseteq domain')
        flag = true;
    end
end

% fix domain
padding = 1.1;
if flag
    warning('nflearn:domainfix', 'Automatically changing domain')
    domain = padding *auto_domain;
end

% checks interval1 \subseteq interval2
function [itis] = issubinterval(interval1, interval2)
itis = 1;

if interval1(1, 1) < interval2(1, 1)
    itis = 0;
    return
end

if interval2(1, 2) > interval2(1, 2)
    itis = 0;
    return
end
