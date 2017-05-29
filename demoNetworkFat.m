%DEMONETWORKFAT  One-line description here, please.
%
%   output = demoNetworkFat(input)
%
%   Example
%   demoNetworkFat
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2017-05-29,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - Cepia Software Platform.

% create demo data sets
vbeu = Table(randn( 8,  200));  % n2 x p1
nbeu = Table(randn( 8,  850));  % n2 x p2
mbeu = Table(randn( 8, 1816));  % n2 x p3
nmar = Table(randn(13,  850));  % n3 x p2
mref = Table(randn(17, 1816));  % n1 x p3

%
data = {vbeu, nbeu, mbeu, nmar, mref};

names = {'VBeu', 'NBeu', 'MBeu', 'NMar', 'MRef'};

ND = networkData(data, names);

nBlocks = length(data);
% number of connected components in rows
ncr = size(unique(ND.rows.data + eye(nBlocks), 'rows'), 1);
disp(['NCC in rows = ' num2str(ncr)]);

% number of connected components in columns
ncc = size(unique(ND.rows.data + eye(nBlocks), 'rows'), 1);
disp(['NCC in colmns = ' num2str(ncc)]);

