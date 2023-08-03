% Create a quiver plot with the direction vectors
figure
quiver3(points(:,1), points(:,2), points(:,3), movement(:,1), movement(:,2), movement(:,3), 1.25);
title ('Direction vectors of rotation and translation');
colormap summer;
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/visual_direction_vectors_', object, triangle_size_calculation, '.png'));
end