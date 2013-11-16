# Numerical Utilities for MATLAB

## Summary
Vectorized and other convenience functions.
Licensed under the 2-clause BSD.

## Description
These functions were developed over time to support my research.
The vectorized ones aim to make vector field codes brief, coordinate-free, clear and readable.
The more interesting are:

- vectorized meshgrid: generate and manipulate grids (parallelepiped or polar), handy for computing functions accepting column vectors as arguments and vectorized surface plotting, previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/35036-vectorized-meshgrid)
- normvec: vectorized normalization, previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/36248-normalize-n-d-vectors-in-single-matrix-or-n-component-matrices)
- cell extrema, previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/35983-cell-extrema)
- anti-eigenvalues
- 3d matrix multiplication using [multiprod](http://www.mathworks.com/matlabcentral/fileexchange/8773-multiple-matrix-multiplications-with-array-expansion-enabled)
- Cartesian, polar coordinate helpers
- `proximity_components` finds the connected components of a point set, given some distance threshold, requires [`vdistance`](http://www.mathworks.com/matlabcentral/fileexchange/71-distance-m) (renamed) and [`scomponents`](http://www.mathworks.com/matlabcentral/fileexchange/24134-gaimc-graph-algorithms-in-matlab-code)
- `vremnan` to remove by row or column if they contain `NaN`, vector-oriented function inspired by [`remnan`](http://www.mathworks.com/matlabcentral/fileexchange/10863-remnan)
- `omit` to exclude a value, e.g., for taking omitted products

## Installation
Add the directory tree of this package to your MATLAB path.
Some functions have [fex](http://www.mathworks.com/matlabcentral/) dependencies.
No dependency is OS-specific.
