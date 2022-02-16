function plotBaselineActivity(bsMean, bsStd, timeVec, color)

plot([timeVec(1), timeVec(end)], [bsMean, bsMean], '--', 'Color', color)
patch([timeVec(1), timeVec(end), timeVec(end), timeVec(1)], ...
    [bsMean - bsStd, bsMean - bsStd, ...
    bsMean + bsStd, bsMean + bsStd], ...
    'r', 'FaceColor', color, 'FaceAlpha', 0.2, ...
    'EdgeColor', 'none')

end