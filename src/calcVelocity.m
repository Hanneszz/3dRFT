function [movement, movement_normalized] = calcVelocity(points, depth, intruder_height, direction_vector, linear_velocity, rotation, angular_velocity, threshold)
    
    n_elements = size(points, 1);
    
    vcor = linear_velocity .* direction_vector .* 1000; 
    movement = ones(n_elements,1) .* vcor ;
    
    if rotation

        r_list = [points(:,1) points(:,2) points(:,3) + depth .* 1000 - intruder_height / 2]; %  + ones(n_elements,1) .* 100
        v_sum = cross(ones(n_elements,1) .* angular_velocity, r_list) + movement;
        movement= round(v_sum, 15);
    end
    
    movement_normalized = movement ./ vecnorm(movement, 2, 2);
    
    movement(abs(movement) < threshold) = 0;
    movement_normalized(abs(movement_normalized) < threshold) = 0;
    
end