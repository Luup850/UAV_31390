%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIT License
% 
% Copyright (c) 2021 David Wuthier (dwuthier@gmail.com)
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION

clear
close all
clc

%% CUSTOM STUFF 6.1
map = [0 0 0 0 0 0 0 0 0 0;
       0 1 0 1 1 1 1 1 1 0;
       1 1 0 1 1 0 0 0 1 0;
       0 0 0 0 1 0 1 0 1 0;
       0 1 1 0 0 0 1 0 0 0;
       0 0 1 1 1 1 1 1 1 0;
       1 0 0 0 1 0 0 0 1 0;
       1 1 1 0 0 0 1 0 1 0;
       1 1 1 1 1 1 1 0 1 0;
       0 0 0 0 0 0 0 0 0 0];
map = rot90(map); map = rot90(map); map = rot90(map);

route = dijkstra(map, [1,1,1], [4,6,1]);
route(:,1) = route(:,1)-1;
route(:,2) = route(:,2)-1;


%plot3(route(:,1), route(:,2), route(:,3), '-k')

% Below is an approach to optimize the route
%new_route = [];
%for i = 1:length(route)
%    if i == 1
%        prev = route(1,:);
%        new_route = [new_route; prev];
%    elseif i == length(route)
%        new_route = [new_route; route(i,:)];
%    else
%        if (prev(1) == route(i,1) && route(i+1,1) == route(i,1)) || (prev(2) == route(i,2) && route(i+1,2) == route(i,2))
%        else
%            new_route = [new_route; route(i,:)];
%        end
%    end
%end

%route = new_route;
%% CUSTOM STUFF Exercise 6.2
k_x = 1; % Pos
k_y = 1; % Vel


%% CUSTOM STUFF Exercise 6.4
working_waypoints = dijkstra(map, [1,1,1], [10,10,1]);
working_waypoints(:,1) = working_waypoints(:,1)-1;
working_waypoints(:,2) = working_waypoints(:,2)-1;


%% SIMULATION PARAMETERS

%route = [0 0 1 ; 9 0 1 ; 9 9 1]; % Removed because of Exercise 6.1
wall_color = [0.8 0.2 0.2];
sample_time = 4e-2;
publish_rate = 1 * sample_time;
x0 = 36;
y0 = 80;
z0 = 1;
g = 9.80665 ;
mass_drone = 0.68 ;
mass_rod = 0.0;
mass_tip = 0;
mass_total = mass_drone + mass_rod + mass_tip;
stiffness_rod = 100 ;
critical_damping_rod = 2 * sqrt(mass_total * stiffness_rod) ;
stiffness_wall = 100 ;
critical_damping_wall = 2 * sqrt(mass_total * stiffness_wall) ;
inertia_xx = 0.007 ;
inertia_yy = 0.007 ;
inertia_zz = 0.012 ;
arm_length = 0.17 ;
rotor_offset_top = 0.01 ;
motor_constant = 8.54858e-06 ;
moment_constant = 0.016 ;
max_rot_velocity = 838 ;
allocation_matrix = ...
    [1 1 1 1
     0 arm_length 0 -arm_length
     -arm_length 0 arm_length 0
     -moment_constant moment_constant -moment_constant moment_constant] ;
mix_matrix = inv(motor_constant * allocation_matrix) ;
air_density = 1.2041;
drag_coefficient = 0.47;
reference_area = pi * 75e-3^2;
