function [z_local, r_local, theta_local] = findLocalFrame(normals_include, movement_include, movement_nn_include, include, unit_test)
    
    if unit_test
    z_local = repmat([0,0,1], numel(depth_list_include), 1);
    else
    z_local = repmat([0,0,1], sum(include), 1);
    end
    
    r_local = zeros(size(normals_include,1),3);
    for i = 1:size(normals_include,1)
    if (vecnorm(movement_include(i,:) - dot(movement_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2) == 0 && vecnorm(normals_include(i,:) - dot(normals_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2) == 0)
    r_local(i,:) = [1; 0; 0];
    elseif (vecnorm(movement_nn_include(i,:) - dot(movement_nn_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2) == 0 && vecnorm(normals_include(i,:) - dot(normals_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2) ~= 0)
    r_local(i,:) = (normals_include(i,:) - dot(normals_include(i,:), z_local(i,:), 3) .* z_local(i,:)) ./ vecnorm(normals_include(i,:) - dot(normals_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2);
    else
    r_local(i,:) = (movement_nn_include(i,:) - dot(movement_nn_include(i,:), z_local(i,:), 3) .* z_local(i,:)) ./ vecnorm(movement_nn_include(i,:) - dot(movement_nn_include(i,:), z_local(i,:), 3) .* z_local(i,:), 2, 2);
    end
    end
    
    theta_local = cross(z_local, r_local, 2);
    
end