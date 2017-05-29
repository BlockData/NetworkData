function [network, CompoConnex] = networkData(collection, names)
% Build a network for a collection of blocks 
%
% NetW are adjacency matrices describing the network
% CompoConnex describe the connexe components of the network


% Number of data blocks in the collection
nBlocks = length(collection); 

% adjacecny matrices for rows and for columns
M = zeros(nBlocks, nBlocks, 2);

for i = 1:nBlocks
    dataI = collection{i};
    
    for j = 1:nBlocks
        dataJ = collection{j};
        
        % compute adjacency matrix for mode 1 (rows)
        if length(dataI.rowNames) == length(dataJ.rowNames)
            M(i, j, 1) = all(strcmp(dataI.rowNames, dataJ.rowNames));
        end
        
        % compute adjacency matrix for mode 2 (columns)
        if length(dataI.colNames) == length(dataJ.colNames)
            M(i, j, 2) = all(strcmp(dataI.colNames, dataJ.colNames));
        end
    end
end

% create result data tables
rowNetwork = Table(M(:,:,1)-eye(nBlocks), names, names');
rowNetwork.name = 'Row';
colNetwork = Table(M(:,:,2)-eye(nBlocks), names, names');
colNetwork.name = 'Col';

network.rows = rowNetwork;
network.cols = colNetwork;


% %% Connected Components
% 
% % connected components from rows
% [CC, ia, ic] = unique(M(:,:,1),'rows');
% connexeRow.d=logical(CC');
% connexeRow.i=collectionNames;
% connexeRow.v=addcode(num2str1((1:rank(M(:,:,1)))',2),'C #');
% 
% [CC, ia, ic] = unique(M(:,:,2),'rows');
% connexeCol.d=logical(CC');
% connexeCol.i=collectionNames;
% connexeCol.v=addcode(num2str1((1:rank(M(:,:,2)))',2),'C #');
% CompoConnex(1)=connexeRow;
% CompoConnex(2)=connexeCol;
% sizeblocks1=zeros(size(CompoConnex(1).d,2),1);
% sizeblocks2=zeros(size(CompoConnex(2).d,2),1);    
% for i=1:size(CompoConnex(1).d,2)
%           idx=CompoConnex(1).d(:,i)';
%           coll =collection(logical(idx));
%          sizeblocks1(i,1)=size(coll(1).d,1);
%  end
%      s=CompoConnex(1).d*sizeblocks1;
%    CompoConnex(1).size=s;
%  for i=1:size(CompoConnex(2).d,2)
%           idx=CompoConnex(2).d(:,i)';
%           coll =collection(logical(idx));
%          sizeblocks2(i,1)=size(coll(1).d,2);
%  end
%   s=CompoConnex(2).d*sizeblocks2;
%    CompoConnex(2).size=s;
%    CompoConnex(1).dims=sizeblocks2; 
%    CompoConnex(2).dims=sizeblocks1;
%     
