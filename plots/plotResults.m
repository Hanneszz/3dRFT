fig_width = 1200;
fig_height = 600;
figure('Units', 'pixels', 'Position', [100, 100, fig_width, fig_height]);
tl = tiledlayout(2, 3, "TileSpacing", "loose", "Padding", "loose");

forces_span = abs( min(min(results(2:4,:))) - max(max(results(2:4,:))) );
torque_span = abs( min(min(results(5:7,:))) - max(max(results(5:7,:))) );

nexttile;
plot(depths, results(2,:), LineWidth=1.5, Color='#004c4c');
xlim([0 max(depths)]);
ylim([min(min(results(2:4,:)))-forces_span/10 max(max(results(2:4,:)))+forces_span/10]);
title("(a)");
xlabel("Depth [m]");
ylabel("Force [N]");

nexttile;
plot(depths, results(3,:), LineWidth=1.5, Color='#004c4c');
xlim([0 max(depths)]);
ylim([min(min(results(2:4,:)))-forces_span/10 max(max(results(2:4,:)))+forces_span/10]);
title("(b)");
xlabel("Depth [m]");
ylabel("Force [N]");

nexttile;
plot(depths, results(4,:), LineWidth=1.5, Color='#004c4c');
xlim([0 max(depths)]);
ylim([min(min(results(2:4,:)))-forces_span/10 max(max(results(2:4,:)))+forces_span/10]);
title("(c)");
xlabel("Depth [m]");
ylabel("Force [N]");

nexttile;
plot(depths, results(5,:), LineWidth=1.5, Color='#66b2b2');
xlim([0 max(depths)]);
ylim([min(min(results(5:7,:)))-torque_span/10 max(max(results(5:7,:)))+torque_span/10]);
title("(d)");
xlabel("Depth [m]");
ylabel("Torque [Nm]");

nexttile;
plot(depths, results(6,:), LineWidth=1.5, Color='#66b2b2');
xlim([0 max(depths)]);
ylim([min(min(results(5:7,:)))-torque_span/10 max(max(results(5:7,:)))+torque_span/10]);
title("(e)");
xlabel("Depth [m]");
ylabel("Torque [Nm]");

nexttile;
plot(depths, results(7,:), LineWidth=1.5, Color='#66b2b2');
xlim([0 max(depths)]);
ylim([min(min(results(5:7,:)))-torque_span/10 max(max(results(5:7,:)))+torque_span/10]);
title("(f)");
xlabel("Depth [m]");
ylabel("Torque [Nm]");

sgtitle("\bf{Sum of forces split per axis (a-c) and sum of torques per axis (d-f)}", "Fontsize", 16);

set(findall(gcf,'-property','FontSize'),'FontSize',16);