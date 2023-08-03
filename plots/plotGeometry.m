% Plot
figure;
title("Meshed intruding object");
hold on
colormap winter;
trisurf(TRG);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/visual_mesh_', object, triangle_size_calculation, '.png'));
end

figure;
title("Centerpoints of the subsurfaces");
hold on;
colormap winter;
scatter3(points(:,1), points(:,2), points(:,3), 5, 'filled');
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/visual_points_', object, triangle_size_calculation, '.png'));
end

figure;
title("Normals of the subsurfaces");
hold on;
colormap summer;
quiver3(points(:,1), points(:,2), points(:,3), normals(:,1), normals(:,2), normals(:,3), 1.25);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/visual_normals_', object, triangle_size_calculation, '.png'));
end