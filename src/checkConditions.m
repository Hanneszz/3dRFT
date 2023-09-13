function [include, normals_include, movement_normalized_include,...
    movement_include, areas_include, points_include, depth_list_include]...
    = checkConditions(points, normals, areas, movement, movement_normalized,...
    depth_list, unit_test, threshold)
    
    is_leading_edge = dot(normals, movement_normalized, 2) >= -threshold;
    is_intruding = points(:,3) < 0;
    include = is_leading_edge & is_intruding;
    
    normals_include = normals(include,:);
    movement_normalized_include = movement_normalized(include,:);
    movement_include = movement(include,:);
    areas_include = areas(include,:);
    points_include = points(include,:);
    depth_list_include = depth_list(include,:);
    
    if unit_test
    pointsTest = [90 180];
    normals_include = normals_include(pointsTest,:);
    movement_normalized_include = movement_normalized_include(pointsTest,:);
    areas_include = areas_include(pointsTest,:);
    points_include = points_include(pointsTest,:);
    depth_list_include = depth_list_include(pointsTest,:);
    end
    
end