% Plot forces on each point of the mesh (quiver)
figure;
title ('Forces on each subsurface');
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
q = quiver3(points_include(:,1), points_include(:,2), points_include(:,3), -forces(:,1), -forces(:,2), -forces(:,3),2, 'LineWidth', 1, 'MaxHeadSize', 0);
currentColormap = jet;
setQuiverColor(q,currentColormap);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/forces_quiver_', object, triangle_size_calculation, '.png'));
end