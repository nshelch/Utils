function cmap = cmap_gradient(color_range, varargin)

% default setings
ncolors = 64;
prop_low = .5;
prop_high = .5;

low_color = color_range(1, :);
high_color = color_range(end, :);
if size(color_range, 1) == 3
    mid_color = color_range(2, :);
else
    mid_color = mean(color_range);
end

% Change default proportions and number of colors inbetween low and high
for vv = 1:length(varargin)
    if length(varargin{vv}) == 1
        ncolors = varargin{vv};
    elseif length(varargin{vv}) == 2
        prop_low = varargin{vv}(1);
        prop_high = varargin{vv}(2);
    end
end

low_cmap = [linspace(low_color(1), mid_color(1), ceil(ncolors * prop_low))',...
    linspace(low_color(2), mid_color(2), ceil(ncolors * prop_low))',...
    linspace(low_color(3), mid_color(3), ceil(ncolors * prop_low))'];

high_cmap = [linspace(mid_color(1), high_color(1), ceil(ncolors * prop_high))',...
    linspace(mid_color(2), high_color(2), ceil(ncolors * prop_high))',...
    linspace(mid_color(3), high_color(3), ceil(ncolors * prop_high))'];

cmap = [low_cmap(1:end - 1, :); high_cmap];

if any(cmap > 1)
    cmap = cmap ./ 255;
end

end