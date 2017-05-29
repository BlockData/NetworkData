classdef NetworkData < handle
%NETWORKDATA  One-line description here, please.
%
%   Class NetworkData
%
%   Example
%   NetworkData
%
%   See also
%

% ------
% Author: David Legland & Mohamed Hanafi
% e-mail: david.legland@inra.fr
% Created: 2017-05-29,    using Matlab 9.1.0.441655 (R2016b)
% Copyright 2017 INRA - BIA-BIBS.


%% Properties
properties
    data;
    names;
    rows;
    cols;

end % end properties


%% Constructor
methods
    function this = NetworkData(data, names)
        % Constructor for NetworkData class

        this.data = data;
        this.names = names;
        
        % Number of data blocks in the collection
        nBlocks = length(data);

        % adjacecny matrices for rows and for columns
        matRows = zeros(nBlocks, nBlocks);
        matCols = zeros(nBlocks, nBlocks);

        for i = 1:nBlocks
            dataI = data{i};

            for j = 1:nBlocks
                % do not process the diagonal
                if j == i
                    continue;
                end
                
                dataJ = data{j};

                % compute adjacency matrix for mode 1 (rows)
                if length(dataI.rowNames) == length(dataJ.rowNames)
                    matRows(i, j) = all(strcmp(dataI.rowNames, dataJ.rowNames));
                end

                % compute adjacency matrix for mode 2 (columns)
                if length(dataI.colNames) == length(dataJ.colNames)
                    matCols(i, j) = all(strcmp(dataI.colNames, dataJ.colNames));
                end
            end
        end

        % create result data tables
        this.rows = Table(matRows, names, names', 'name', 'Rows');
        this.cols = Table(matCols, names, names', 'name', 'Cols');
    end

end % end constructors


%% Methods
methods
end % end methods

end % end classdef

