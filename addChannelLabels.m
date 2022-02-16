function addChannelLabels(arrayInfo, arrayIdx, varargin)

fsize = 10;
textColor = 'w';

for vv = 1:2:numel(varargin)
    if strcmp(varargin{vv}, 'FontSize')
        fsize = varargin{vv + 1};
    elseif strcmp(varargin{vv}, 'Color')
        textColor = varargin{vv + 1};
    end        
end
validSubplots = arrayInfo.GridLoc{arrayIdx}(~isnan(arrayInfo.GridLoc{arrayIdx}))';

% Add channel labels to graph
set(gca, 'YDir', 'reverse')
for ss = validSubplots
    chIdx = arrayInfo.ChanIndices{arrayIdx} == ss;
    electrode = arrayInfo.ChanToElectrode{arrayIdx}(chIdx);
    [row, col] = find(arrayInfo.GridLoc{arrayIdx} == ss);
    xpos = col - 1;
    ypos = row - 1;
    text(xpos + 1, ypos + 1, num2str(electrode), 'FontSize', fsize, 'Color', textColor, 'HorizontalAlignment', 'center')
end

end