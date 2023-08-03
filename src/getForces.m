function [forces, pressures, force_x, force_y, force_z, resultant] = getForces(depth_list_include, areas_include, alpha)
    
    forces = alpha .* abs(depth_list_include) .* areas_include;     % N
    pressures = forces ./ areas_include ./ 1000000;                 % N/mm²

    [force_x] = sum(forces(:,1),1);
    [force_y] = sum(forces(:,2),1);
    [force_z] = sum(forces(:,3),1);
    [resultant] = sqrt(force_x^2 + force_y^2 + force_z^2);

end