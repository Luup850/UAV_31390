function [custom_trajectory] = custom_generate_trajectory(waypoints, time, margin_x, margin_y, margin_z)
%GENERATE_TRAJECTORY Summary of this function goes here
%   Waypoints - Listen af punkter som dronen skal besøge.
%   Time - Den tid dronen har til at fuldføre missionen.
    custom_trajectory.times = [];
    custom_trajectory.x_lower = [];
    custom_trajectory.x_upper = [];
    custom_trajectory.y_lower = [];
    custom_trajectory.y_upper = [];
    custom_trajectory.z_lower = [];
    custom_trajectory.z_upper = [];
    n = length(waypoints(:,1));
    slice = time / n;
    
    for i = 1:n
        custom_trajectory.times = [custom_trajectory.times, i*slice];
        custom_trajectory.x_lower = [custom_trajectory.x_lower, (waypoints(i, 1)-margin_x)];
        custom_trajectory.x_upper = [custom_trajectory.x_upper, waypoints(i, 1)+margin_x];
        custom_trajectory.y_lower = [custom_trajectory.y_lower, waypoints(i, 2)-margin_y];
        custom_trajectory.y_upper = [custom_trajectory.y_upper, waypoints(i, 2)+margin_y];
        custom_trajectory.z_lower = [custom_trajectory.z_lower, waypoints(i, 3)-margin_z];
        custom_trajectory.z_upper = [custom_trajectory.z_upper, waypoints(i, 3)+margin_z];
    end
end

