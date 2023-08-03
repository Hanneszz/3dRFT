function [T, torque_x, torque_y, torque_z] = getTorques(points_include, depth_list_include, forces, unit_test, include)
    
    if unit_test
    c_null = zeros(numel(depth_list_include), 1);
    else
    c_null = zeros(sum(include),1);
    end
    
    c_x = [c_null points_include(:,2) points_include(:,3)];
    c_y = [points_include(:,1) c_null points_include(:,3)];
    c_z = [points_include(:,1) points_include(:,2) c_null];
    
    F_x = [c_null forces(:,2) forces(:,3)];
    F_y = [forces(:,1) c_null forces(:,3)];
    F_z = [forces(:,1) forces(:,2) c_null];
    
    T_x = cross(c_x,F_x) ./ 1000;
    T_y = cross(c_y,F_y) ./ 1000;
    T_z = cross(c_z,F_z) ./ 1000;
    
    T = [T_x(:,1) T_y(:,2) T_z(:,3)];
    
    [torque_x] = sum(T_x(:,1), 1);
    [torque_y] = sum(T_y(:,2), 1);
    [torque_z] = sum(T_z(:,3), 1);
    
end