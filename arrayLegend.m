function arrayLegend(electrode, arrayInfo, arrayIdx, varargin)

fsize = 8;
fc = 'r';
plotChannelLabels = 1;

for vv = 1:2:numel(varargin)
   if strcmpi(varargin{vv}, 'FontSize')
       fsize = varargin{vv + 1};
   elseif strcmpi(varargin{vv}, 'Color')
       fc = varargin{vv + 1};
   elseif strcmpi(varargin{vv}, 'ChannelLabels')
       plotChannelLabels = varargin{vv + 1};
   end
end

arrayCmap = [rgb(224, 224, 224); fc];

% Create the binary array of channels
binaryArray = double(~isnan(arrayInfo.GridLoc{arrayIdx}));
binaryArray(binaryArray == 0) = NaN;

% Find the electrode(s) of interest
for ee = 1:length(electrode)
    channel = arrayInfo.ChanIndices{arrayIdx}(ismember(arrayInfo.ChanToElectrode{arrayIdx}, electrode(ee)));
    eIdx = ismember(arrayInfo.GridLoc{arrayIdx}, channel);
    binaryArray(eIdx) = max(binaryArray(:)) + 1;
end

% Plot these bad boys
h = imagesc(binaryArray);
set(h, 'AlphaData', ~isnan(binaryArray))
set(gca, 'Colormap', arrayCmap)
axis off

% Plot channel labels
validSubplots = arrayInfo.GridLoc{arrayIdx}(~isnan(arrayInfo.GridLoc{arrayIdx}))';
if plotChannelLabels
    set(gca, 'YDir', 'reverse')
    for ss = validSubplots
        chIdx = arrayInfo.ChanIndices{arrayIdx} == ss;
        electrode = arrayInfo.ChanToElectrode{arrayIdx}(chIdx);
        [row, col] = find(arrayInfo.GridLoc{arrayIdx} == ss);
        xpos = col - 1;
        ypos = row - 1;
        text(xpos + .5, ypos + .5, num2str(electrode), 'FontSize', fsize, ...
            'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')
    end
end



end