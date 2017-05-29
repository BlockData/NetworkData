function CCMat = connectedComponents(this, order)
%CONNECTEDCOMPONENTS Compute matrix of connected components
%
%   CC = connectedComponents(NWD, ORDER)
%
%   Example
%   connectedComponents
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2017-05-29,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - Cepia Software Platform.

if nargin < 2
    order = 1;
end

nBlocks = length(this.data);

switch order
    case 1
        % number of connected components in rows
        mat = unique(this.rows.data + eye(nBlocks), 'rows');
        
    case 2
        % number of connected components in columns
        mat = unique(this.cols.data + eye(nBlocks), 'rows');
        
    otherwise
        error('Order must be either 1 or 2');
end

CCMat = Table(mat, this.names);