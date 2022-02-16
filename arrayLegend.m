function arrayLegend(electrode, arrayInfo, arrayIdx, varargin)

fsize = 8;

for vv = 1:2:numel(varargin)
   if strcmp(varargin{vv}, 'FontSize')
       fsize = varargin{vv + 1};
   end
end

% Find valid electrode subplots
validSubplots = arrayInfo.GridLoc{arrayIdx}(~isnan(arrayInfo.GridLoc{arrayIdx}))';

% Convert channel number to electrode number
channelIdx = ismember(arrayInfo.ChanToElectrode{arrayIdx}, electrode);
channel = arrayInfo.ChanIndices{arrayIdx}(channelIdx);


set(gca, 'YDir', 'reverse')
for ss = validSubplots
    chIdx = arrayInfo.ChanIndices{arrayIdx} == ss;
    electrode = arrayInfo.ChanToElectrode{arrayIdx}(chIdx);
    [row, col] = find(arrayInfo.GridLoc{arrayIdx} == ss);
    xpos = col - 1;
    ypos = row - 1;
    
    if any(ss == channel)
        fc = 'r';
    else
        fc = [200 200 200] / 255;
    end
    
    rectangle('Position', [xpos, ypos, 1, 1], 'FaceColor', fc, 'EdgeColor', 'k')
    text(xpos + .5, ypos + .5, num2str(electrode), 'FontSize', fsize, ...
        'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')
end
axis off
axis square
title(arrayInfo.ArrayNames{arrayIdx}, 'FontSize', fsize)

end