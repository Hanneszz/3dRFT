function setPlotProperties(x_range, y_range, z_range)
    view([45 25]);
    daspect([1 1 1]);
    xlabel('X  [mm]');
    ylabel('Y  [mm]');
    zlabel('Z  [mm]');
    axis on;
    grid off;
    xlim(x_range);
    ylim(y_range);
    zlim(z_range);
    set(findall(gcf,'-property','FontSize'),'FontSize',16);
end