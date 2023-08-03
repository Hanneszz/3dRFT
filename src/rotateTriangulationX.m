function TRG = rotateTriangulationX(TRG, theta)
    
    % Create the rotation matrix
    R = [1 0 0; 0 round(cosd(theta), 15) -round(sind(theta), 15); 0 round(sind(theta), 15) round(cosd(theta), 15)];
    % Rotate the points in the triangulation object
    Points = TRG.Points * R;
    
    % Create a new triangulation object with the rotated points and the same connectivity list
    TRG = triangulation(TRG.ConnectivityList, Points);
    
end