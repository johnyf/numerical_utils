function [box] = min_bounding_box_aligned(data_column_vectors)
%minimum volume axis-aligned box bounding the given vectors
%
%usage
%-----
%   min_bounding_box_aligned(data_column_vectors)
%
%input
%-----
%   data_column_vectors = coordinates of data points as matrix of column
%                         vectors
%                       = [#dim x #pnts]
%
%output
%------
%   box = [x1_min, x1_max, ..., x#dim_min, x#dim_max]
%
%about
%-----
%2013.02.27 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
%See also check_domain, box2domain, domain2box, boxdomain.

box = [min(data_column_vectors, [], 2), max(data_column_vectors, [], 2) ];
