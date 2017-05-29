%DEMONETWORKDATA  One-line description here, please.
%
%   output = demoNetworkData(input)
%
%   Example
%   demoNetworkData
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2017-05-29,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - Cepia Software Platform.


%% read demo table

iris = Table.read('fisherIris.txt');
data = iris(:, 1:4);

%% split columns

% split columns
cols1 = data(:, 1:2);
cols2 = data(:, 3:4);

names = {'Sepal', 'Petal'};
ND = networkData({cols1, cols2}, names);


% soku
data1 = data(  1: 50, :);
data2 = data( 51:100, :);
data3 = data(101:150, :);
