function [alpha_gen, alpha_gen_n, alpha_gen_t, alpha] = findAlpha(normals_include, movement_normalized_include, beta, gamma, psi, r_local, theta_local, z_local, f1, f2, f3, mu_surf, xi_n)
    
    alpha_r_gen = f1 .* round(sin(beta), 15) .* round(cos(psi), 15) + f2 .* round(cos(gamma), 15);
    alpha_theta_gen = f1 .* round(sin(beta), 15) .* round(sin(psi), 15);
    alpha_z_gen = -f1 .* round(cos(beta), 15) - f2 .* round(sin(gamma), 15) - f3;
    
    alpha_gen = alpha_r_gen.*r_local + alpha_theta_gen.*theta_local + alpha_z_gen.*z_local;
    
    % Calculate the system specific alpha_n and alpha_t in the local coordinate frame
    % Correcting minor sign problems
    alpha_gen_n = zeros(size(normals_include,1),3);
    alpha_gen_t = zeros(size(normals_include,1),3);
    for i = 1:size(normals_include,1)
        if dot(alpha_gen(i,:),-normals_include(i,:),2) < 0
        alpha_gen_n(i,:) = -dot(alpha_gen(i,:),-normals_include(i,:),2) .* (-normals_include(i,:));
        alpha_gen_t(i,:) = (alpha_gen(i,:) + alpha_gen_n(i,:));
        else
        alpha_gen_n(i,:) = dot(alpha_gen(i,:),-normals_include(i,:),2) .* (-normals_include(i,:));
        alpha_gen_t(i,:) = (alpha_gen(i,:) - alpha_gen_n(i,:));
        end
    end
    
    for i = 1:size(normals_include,1)
        if dot(alpha_gen_t(i,:),-movement_normalized_include(i,:),2) < 0
        alpha_gen_t(i,:) = -(alpha_gen_t(i,:));
        end
    end
     
    alpha = xi_n .* (alpha_gen_n + min(mu_surf .* vecnorm(alpha_gen_n,2,2) ./ vecnorm(alpha_gen_t,2,2),1) .* alpha_gen_t);

end