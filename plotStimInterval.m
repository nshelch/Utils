function plotStimInterval(stimStart, stimEnd, yMax, varargin)

color = rgb('LightSlateGrey');
for vv = 1:length(varargin)
    color = varargin{vv};
end
patch([stimStart, stimEnd, stimEnd, stimStart], [0, 0, yMax, yMax], ...
    'r', 'FaceColor', color, 'FaceAlpha', 0.25, ...
    'EdgeColor', 'none')

end