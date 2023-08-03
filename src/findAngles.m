function [beta, gamma, psi] = findAngles(normals_include, movement_normalized_include, r_local, z_local, theta_local)
    
    % beta - surface characteristic angle
    beta = zeros(size(normals_include,1),1);
    for i = 1:size(normals_include,1)
    if (dot(normals_include(i,:),r_local(i,:), 2) >= 0) && (dot(normals_include(i,:),z_local(i,:), 2) >= 0)
        beta(i) = - round(acos(dot(normals_include(i,:),z_local(i,:), 2)), 15);
    elseif  (dot(normals_include(i,:),r_local(i,:), 2) >= 0) && (dot(normals_include(i,:),z_local(i,:), 2) < 0)
        beta(i) = +pi - round(acos(dot(normals_include(i,:),z_local(i,:), 2)), 15);
    elseif  (dot(normals_include(i,:),r_local(i,:), 2) < 0) && (dot(normals_include(i,:),z_local(i,:), 2) >= 0)
        beta(i) =     + round(acos(dot(normals_include(i,:),z_local(i,:), 2)), 15);
    else 
        beta(i) = -pi + round(acos(dot(normals_include(i,:),z_local(i,:), 2)), 15);
    end
    end
    
    % gamma - velocity characteristic angle
    % gamma = zeros(size(movement_normalized_include,1),1);
    % for i = 1:size(movement_normalized_include,1)
    % if dot(movement_normalized_include(i,:), z_local(i,:), 2) <= 0
    % gamma(i) = round(acos(dot(movement_normalized_include(i,:), r_local(i,:), 2)), 15);
    % else
    % gamma(i) = -round(acos(dot(movement_normalized_include(i,:), r_local(i,:), 2)), 15);
    % end
    % end

    gamma = zeros(size(movement_normalized_include, 1), 1);
    for i = 1:size(movement_normalized_include, 1)
    dot_product = dot(movement_normalized_include(i, :), r_local(i, :), 2);
    dot_product_clamped = max(-1, min(1, dot_product));  % Clamp dot_product within [-1, 1]
    gamma(i) = acos(dot_product_clamped);
    
    if dot(movement_normalized_include(i, :), z_local(i, :), 2) > 0
        gamma(i) = -gamma(i);
    end
    end

    
    % psi - surface characteristic angle
    psi = zeros(size(normals_include,1),1);
    nr0_inc = zeros(size(normals_include,1),3);
    for i = 1:size(normals_include,1)
    nr0_inc(i,:) = (normals_include(i,:) - (dot(normals_include(i,:),z_local(i,:), 2) .* z_local(i,:))) ./ vecnorm(normals_include(i,:) - (dot(normals_include(i,:),z_local(i,:), 2) .* z_local(i,:)),2,2);
    if vecnorm(normals_include(i,:) - (dot(normals_include(i,:),z_local(i,:), 2) .* z_local(i,:)),2,2) == 0 || dot(nr0_inc(i,:),r_local(i,:),2) == 0
    psi(i) = 0;
    else
    psi(i) = round(atan( dot(nr0_inc(i,:),theta_local(i,:), 2) ./ dot(nr0_inc(i,:),r_local(i,:), 2) ), 15);
    end
    end
    
end