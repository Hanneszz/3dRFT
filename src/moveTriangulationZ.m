function TRG = moveTriangulationZ(TRG, depth)
    
    minZ = min(TRG.Points(:, 3));
    Points = TRG.Points;
    Points(:, 3) = Points(:, 3) - minZ - depth*1000;
    
    % Create a new triangulation object with the shifted points and the same connectivity list
    TRG = triangulation(TRG.ConnectivityList, Points);
    
end