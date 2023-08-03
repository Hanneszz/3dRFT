function [f1, f2, f3] = findFit(gamma, beta, psi, z_local, movement_normalized_include, normals_include, threshold, depth_list_include, include, unit_test)
    
    x1 = round(sin(gamma), 15);
    x2 = round(cos(beta), 15);
    x3 = round(cos(psi), 15) .* round(cos(gamma), 15) .* round(sin(beta), 15) + round(sin(gamma), 15) .* round(cos(beta), 15);
    
    y1 = dot(-z_local, movement_normalized_include,2);
    y2 = dot(-z_local, normals_include,2);
    y3 = dot(normals_include, movement_normalized_include,2);
    
    x1(abs(x1) < abs(threshold)) = 0;
    x2(abs(x2) < abs(threshold)) = 0;
    x3(abs(x3) < abs(threshold)) = 0;
    
    if unit_test
    unitx = ones(numel(depth_list_include), 1);
    else
    unitx = ones(sum(include), 1);
    end
    
    Tk = [unitx x1  x2  x3  x1.^2    x2.^2    x3.^2    x1.*x2  x2.*x3  x3.*x1  x1.^3    x2.^3    x3.^3    x1.*x2.^2    x2.*x1.^2    x2.*x3.^2    x3.*x2.^2    x3.*x1.^2  x1.*x3.^2  x1.*x2.*x3];
    
    c1k = [0.00212; -0.02320; -0.20890; -0.43083; -0.00259; 0.48872; -0.00415; 0.07204; -0.02750; -0.08772; 0.01992; -0.45961; 0.40799; -0.10107; -0.06576; 0.05664; -0.09269; 0.01892; 0.01033; 0.15120]; 
    c2k = [-0.06796; -0.10941; 0.04725; -0.06914; -0.05835; -0.65880; -0.11985; -0.25739; -0.26834; 0.02692; -0.00736; 0.63758; 0.08997; 0.21069; 0.04748; 0.20406; 0.18589; 0.04934; 0.13527; -0.33207];
    c3k = [-0.02634; -0.03436; 0.45256; 0.00835; 0.02553; -1.31290; -0.05532; 0.06790; -0.16404; 0.02287; 0.02927; 0.95406; -0.00131; -0.11028; 0.01487; -0.02730; 0.10911; -0.04097; 0.07881; -0.27519];
    
    f1 = Tk * c1k;
    f2 = Tk * c2k;
    f3 = Tk * c3k;
    
end