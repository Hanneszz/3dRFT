% Multiplot
fig_width = 1500;
fig_height = 500;
figure('Units', 'pixels', 'Position', [0, 0, fig_width, fig_height]);

% Define the maximum value for color limits
max_pressure = max(max(abs(pressures)));

% Create a tiled layout with 1 row and 3 columns
tl = tiledlayout(1,3,'TileSpacing','loose','Padding','compact');

size_data1 = 1000 * max_pressure / max(abs(pressures(:,1))) * abs(pressures(:,1));
size_data1 = max(size_data1, eps); % eps is MATLAB's smallest positive value
size_data2 = 1000 * max_pressure / max(abs(pressures(:,2))) * abs(pressures(:,2));
size_data2 = max(size_data2, eps); 
size_data3 = 1000 * max_pressure / max(abs(pressures(:,3))) * abs(pressures(:,3));
size_data3 = max(size_data3, eps); 

% Plot forces on each point of the mesh (scatter x)
nexttile(tl);
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
s1 = scatter3(points_include(:,1), points_include(:,2), points_include(:,3), 'filled', 'MarkerEdgeColor', 'none', 'CData', pressures(:,1), 'SizeData', size_data1);
colormap(colors_sequential);
clim([-max_pressure max_pressure]);
setPlotProperties(x_range, y_range, z_range);

% Plot forces on each point of the mesh (scatter y)
nexttile(tl);
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#888888', 'FaceAlpha', 0);
s2 = scatter3(points_include(:,1), points_include(:,2), points_include(:,3), 'filled', 'MarkerEdgeColor', 'none', 'CData', pressures(:,2), 'SizeData', size_data2);
colormap(colors_sequential);
clim([-max_pressure max_pressure]);
setPlotProperties(x_range, y_range, z_range);

% Plot forces on each point of the mesh (scatter z)
nexttile(tl);
hold on;
trimesh(TRG_visual, 'LineWidth', 0.1, 'EdgeColor', '#999999', 'FaceAlpha', 0);
s3 = scatter3(points_include(:,1), points_include(:,2), points_include(:,3), 'filled', 'MarkerEdgeColor', 'none', 'CData', pressures(:,3), 'SizeData', size_data3);
colormap(colors_sequential);
clim([-max_pressure max_pressure]);
setPlotProperties(x_range, y_range, z_range);

% Add colorbar to the last subplot
c = colorbar;
c.Layout.Tile = 'north';
c.Ticks = [0 max_pressure];
c.Label.String = 'Pressure [N/mm²]';
set(findall(gcf,'-property','FontSize'),'FontSize',16);

% Save figure
if saveFigures
    set(gcf,'PaperPositionMode','auto')
    print(gcf, '-dpng', '-r300', '-vector', strcat('./', folder, '/Figures/forces_scatter_xyz_', object, triangle_size_calculation, '.png'));
end