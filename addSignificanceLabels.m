function addSignificanceLabels(data, varargin)

fsize = 12;
fweight = 'Normal';
textColor = 'k';
for vv = 1:2:numel(varargin)
    if strcmp(varargin{vv}, 'FontSize')
        fsize = varargin{vv + 1};
    elseif strcmp(varargin{vv}, 'Color')
        textColor = varargin{vv + 1};
    elseif strcmp(varargin{vv}, 'FontWeight')
        fweight = varargin{vv + 1};
    end
end

% Add channel labels to graph
[numRows, numCols] = size(data);
set(gca, 'YDir', 'reverse')
for rr = 1:numRows
    for cc = 1:numCols
        if data(rr, cc) == 1
            text(cc, rr, '\ast', 'FontSize', fsize, 'Color', textColor, 'FontWeight', fweight, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Interpreter', 'tex')
        end
    end
end

end