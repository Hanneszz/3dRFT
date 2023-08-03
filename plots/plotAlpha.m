% Plot
figure;
title ('Forces alpha_{gen} (quiver)');
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
q = quiver3(points_include(:,1), points_include(:,2), points_include(:,3), alpha_gen(:,1), alpha_gen(:,2), alpha_gen(:,3),2, 'LineWidth', 2, 'ShowArrowHead','on', 'MaxHeadSize', 5);
currentColormap = jet;
setQuiverColor(q,currentColormap);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/alpha_gen_quiver_', object, triangle_size_calculation, '.png'));
end

figure;
title ('Normal forces alpha_{gen,n} (quiver)');
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
q = quiver3(points_include(:,1), points_include(:,2), points_include(:,3), alpha_gen_n(:,1), alpha_gen_n(:,2), alpha_gen_n(:,3),2, 'LineWidth', 2, 'ShowArrowHead','on', 'MaxHeadSize', 5);
currentColormap = jet;
setQuiverColor(q,currentColormap);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/alpha_gen_n_quiver_', object, triangle_size_calculation, '.png'));
end

figure;
title ('Tangential forces alpha_{gen,t} (quiver)');
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
q = quiver3(points_include(:,1), points_include(:,2), points_include(:,3), alpha_gen_t(:,1), alpha_gen_t(:,2), alpha_gen_t(:,3),2, 'LineWidth', 2, 'ShowArrowHead','on', 'MaxHeadSize', 5);
currentColormap = jet;
setQuiverColor(q,currentColormap);
setPlotProperties(x_range, y_range, z_range);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/alpha_gen_t_quiver_', object, triangle_size_calculation, '.png'));
end