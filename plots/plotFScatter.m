% % Plot forces on each point of the mesh (scatter)
% figure("Position", [200 200 700 600]);
% % title ('Pressures on each subsurface');
% hold on;
% trimesh(TRG_visual, 'LineWidth', 0.5, 'EdgeColor', '#888888', 'FaceAlpha', 0);
% scatter3(points_include(:,1), points_include(:,2), points_include(:,3), 'filled', 'MarkerEdgeColor', 'none', 'CData', vecnorm(pressures, 2, 2), 'SizeData', 100*abs(vecnorm(pressures, 2, 2))); %250*abs(vecnorm(pressures, 2, 2))
% colormap(jet);
% 
% c = colorbar;
% c.Location = "east";
% c.Label.String = 'Pressure [N/mm²]';
% clim([min(vecnorm(pressures, 2, 2)) max(vecnorm(pressures, 2, 2))]);
% setPlotProperties(x_range, y_range, z_range);
% 
% set(findall(gcf,'-property','FontSize'),'FontSize',20);
% if saveFigures
%     set(gcf,'PaperPositionMode','auto')
%     print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/forces_scatter_', object, triangle_size_calculation, '.png'));
% end

% Plot forces on each point of the mesh (scatter)
figure("Position", [200 200 700 600]);
% title ('Pressures on each subsurface');
hold on;
trimesh(TRG_visual, 'LineWidth', 0.5, 'EdgeColor', '#888888', 'FaceAlpha', 0);

% Filter out zero pressures
nonzero_indices = vecnorm(pressures, 2, 2) > 0;
nonzero_pressures = pressures(nonzero_indices, :);
nonzero_points = points_include(nonzero_indices, :);

scatter3(nonzero_points(:,1), nonzero_points(:,2), nonzero_points(:,3), 'filled', 'MarkerEdgeColor', 'none', 'CData', vecnorm(nonzero_pressures, 2, 2), 'SizeData', 1000*abs(vecnorm(nonzero_pressures, 2, 2))); %250*abs(vecnorm(nonzero_pressures, 2, 2))
colormap(colors_sequential);

c = colorbar;
c.Location = "eastoutside";
c.Label.String = 'Pressure [N/mm²]';
clim([min(vecnorm(nonzero_pressures, 2, 2)) max(vecnorm(nonzero_pressures, 2, 2))]);
setPlotProperties(x_range, y_range, z_range);

axis off;

set(findall(gcf,'-property','FontSize'),'FontSize',20);
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/forces_scatter_', object, triangle_size_calculation, '.png'));
end