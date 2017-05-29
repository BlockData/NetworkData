%DEMONETWORKFAT Demonstrate the use of NetworkData class on Fat dat
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


%% Create data

% create demo data sets
vbeu = Table(randn( 8,  200));  % n2 x p1
nbeu = Table(randn( 8,  850));  % n2 x p2
mbeu = Table(randn( 8, 1816));  % n2 x p3
nmar = Table(randn(13,  850));  % n3 x p2
mref = Table(randn(17, 1816));  % n1 x p3

% initialise data
data = {vbeu, nbeu, mbeu, nmar, mref};
names = {'VBeu', 'NBeu', 'MBeu', 'NMar', 'MRef'};

ND = NetworkData(data, names);

% display result
disp('Result:');
disp(ND);


%% Display adjacency matrices

disp('Adjacency matrix for rows:');
disp(ND.rows);

disp('Adjacency matrix for columns:');
disp(ND.cols);


%% Compute connected components

% connected components in rows
ccr = connectedComponents(ND, 1);
disp(['NCC in rows = ' num2str(size(ccr, 1))]);
disp(ccr);

% connected components in columns
ccc = connectedComponents(ND, 2);
disp(['NCC in columns = ' num2str(size(ccc, 1))]);
disp(ccc);

