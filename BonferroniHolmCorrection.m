function [adjP, h0] = BonferroniHolmCorrection(p, varargin)

% Set the alpha level
alpha = 0.05;
if ~isempty(varargin)
    alpha = varargin{1};
end

% Sort the p-values
[sortedP, pIdx] = sort(p);

% Initialize params
numComp = length(p);
adjP = NaN(1, numComp);
isSig = true;
curP = 1;

% Perform the correction
while isSig && numComp > 0
    if sortedP(curP) * numComp <= alpha
        adjP(curP) = sortedP(curP) * numComp;
        curP = curP + 1;
        numComp = numComp - 1;
    else
        isSig = false;
        adjP(curP:end) = sortedP(curP:end) * numComp;
    end
end

% reorder the p values back to their unsorted state
adjP(pIdx) = adjP;
h0 = adjP <= alpha;
end