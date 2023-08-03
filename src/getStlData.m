function [points, normals, areas, depth_list] = getStlData(TRG, Points, List)
    
    points = (incenter(TRG)').';
    normals = (faceNormal(TRG)').';

    a = vecnorm(Points(:, List(1,:)) - Points(:, List(2,:)));
    b = vecnorm(Points(:, List(2,:)) - Points(:, List(3,:)));
    c = vecnorm(Points(:, List(1,:)) - Points(:, List(3,:)));
    s = (a + b + c) / 2;
    areaarray = sqrt(s .* (s - a) .* (s - b) .* (s - c));

    areas = areaarray.' / 1000000;                          % mm2 to m2
    depth_list = points(:,3) / 1000;                        % mm to m
    
end