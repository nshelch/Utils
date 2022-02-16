function generateMovie(data, stimElectrode, timeVec, cmap, arrayInfo, filename, arrayType)

vidfile = VideoWriter(filename, 'MPEG-4');
vidfile.FrameRate = 5;
open(vidfile);

% cLimMin = -5; %min(min(data(~isinf(data))));
cLimMax = round(max(max(max(data(~isinf(data))))));

for bb = 1:size(data, 1)
    figure('WindowState', 'maximized');
    annotation('textbox', [0.01 0.95 0.25 0.1], 'string', sprintf('Stim Electrode %i', stimElectrode), ...
        'EdgeColor', 'none', 'FontSize', 15, 'FontWeight', 'bold', ...
        'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left')
    ax = axes('Position', [.125 .09 .8, .8]);
    generateHeatmap(squeeze(data(bb, :, :)), cmap, -cLimMax, cLimMax, 1, 'Modulation Value')
    title(sprintf('Time Post Stimulation: %i ms', timeVec(bb)), 'FontSize', 15)
    addChannelLabels(arrayInfo, 3)

    
    if strcmp(arrayType, 'motor')
        msIncet = axes('Position', [-.0125 .35 .15 .225]);
        arrayLegend(stimElectrode, arrayInfo, 2);
        lsIncet = axes('Position', [-.0125 .085 .15 .225]);
        arrayLegend(stimElectrode, arrayInfo, 4);
    else
        mmIncet = axes('Position', [-0.025 .25 .2 .15]);
        arrayLegend(stimElectrode, arrayInfo, 1);
        lmIncet = axes('Position', [-0.025 .05 .2 .15]);
        arrayLegend(stimElectrode, arrayInfo, 3);
    end
    
    writeVideo(vidfile, getframe(gcf));
    close all;
end

close(vidfile)
end

