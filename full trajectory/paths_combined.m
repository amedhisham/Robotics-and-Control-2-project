%% I have to generate the paths for 3 shapes: Line, Circle, Square.
clear
clc

resolution = 0.1; % size of the steps in the for loops

%% LINE
%
% linex = [];
% liney = [];
% 
% x_i = 0;
% x_f = 100;
% 
% y = 0;
% 
% for i = x_i:resolution:x_f
%     linex = [linex; i];
%     liney = [liney, y];
% end
% 
% path_x = linex;
% path_y = liney;

%% SQUARE

% squarex = [];
% squarey = [];
% 
% x1 = 0;
% y1 = 0;
% 
% x2 = 100;
% y2 = y1;
% 
% x3 = x2;
% y3 = 100;
% 
% x4 = 0;
% y4 = y3;
% 
% for i = x1:resolution:x2
%     squarex = [squarex; i];
%     squarey = [squarey; y1];
% end
% for i = y2:resolution:y3
%     squarex = [squarex; x2];
%     squarey = [squarey; i];
% end
% for i = x3:-resolution:x4
%     squarex = [squarex; i];
%     squarey = [squarey; y3];
% end
% for i = y4:-resolution:y1
%     squarex = [squarex; x4];
%     squarey = [squarey; i];
% end
% 
% path_x = squarex;
% path_y = squarey;

%% CIRCLE

% circlex = [];
% circley = [];
% 
% r = 50;
% c = 2*r*pi;
% 
% for i = 0:resolution/10:2*pi
%     circlex = [circlex; r + cos(i)*r];
%     circley = [circley; r + sin(i)*r];
% end
%
% path_x = circlex;
% path_y = circley;

%% MAZE PATH

maze_arr = [50, 850;
            150, 850;
            150, 720;
            350, 720;
            350, 850;
            450, 850;
            500, 830;
            525, 800;
            575, 750;
            600, 725;
            700, 700;
            1000, 700;
            1100, 690;
            1200, 670;
            1300, 650;
            1360, 610;
            1300, 570;
            1250, 560;
            1100, 550;
            1050, 550;
            1050, 400;
            900, 550;
            900, 400;
            750, 550;
            750, 400;
            600, 550;
            400, 650;
            200, 650;
            100, 640;
            50, 630;
            0, 600;
            0, 575;
            20, 550;
            70, 540;
            150, 520;
            175, 500;
            200, 450;
            250, 410;
            300, 400;
            450, 400;
            550, 380;
            600, 350;
            650, 310;
            750, 270;
            900, 250;
            950, 250;
            1100, 250;
            1250, 220;
            1300, 200;
            1325, 175;
            1310, 150;
            1250, 110;
            1160, 100;
            ];
for i = 1150: -10: 490
    maze_arr = [maze_arr;
                i, 50*cos((i-1150)/40)+50;
                ];
end
maze_arr = [maze_arr;
            300, 300;
            ];

rough_maze_x = maze_arr(:, 1);
rough_maze_y = maze_arr(:, 2);

mazex = [];
mazey = [];

for i = 1:length(rough_maze_x)-1

    dist = sqrt( (rough_maze_x(i)-rough_maze_x(i+1))^2 + (rough_maze_y(i)-rough_maze_y(i+1))^2 );
    nsteps = ceil(dist/resolution);

    new_x = linspace(rough_maze_x(i), rough_maze_x(i+1), nsteps + 1)';
    new_y = linspace(rough_maze_y(i), rough_maze_y(i+1), nsteps + 1)';

    if i > 1
        new_x(1) = [];
        new_y(1) = [];
    end

    mazex = [mazex; new_x];
    mazey = [mazey; new_y];
end

path_x = mazex;
path_y = mazey;

%% CLOSED LOOP PATH

% closed_arr = [50, 0;
%             50, 200;
%             100, 200;
%             100, 150;
%             200, 150;
%             200, 200;
%             150, 200;
%             150, 250;
%             200, 250;
%             200, 300;
%             100, 300;
%             100, 250;
%             50, 250;
%             50, 350;
%             100, 350;
%             100, 400;
%             50, 400;
%             50, 500;
%             100, 500;
%             100, 450;
%             150, 450;
%             150, 500;
%             200, 500;
%             200, 400;
%             150, 400;
%             150, 350;
%             300, 350;
%             300, 400;
%             250, 400;
%             250, 500;
%             300, 500;
%             300, 450;
%             350, 450;
%             350, 500;
%             400, 500;
%             400, 400;
%             350, 400;
%             350, 350;
%             400, 350;
%             400, 250;
%             350, 250;
%             350, 300;
%             250, 300;
%             250, 250;
%             300, 250;
%             300, 200;
%             250, 200;
%             250, 150;
%             350, 150;
%             350, 200;
%             400, 200;
%             400, 0;
%             ];
% closed_arr = closed_arr*2;
% 
% for i = 800: -5: 100
%     closed_arr = [closed_arr;
%                 i, -50*sin((i-50)*(i-50)*pi/38400);
%                 ];
% end
% closed_arr = [closed_arr;
%             closed_arr;
%             closed_arr;
%             ];
% 
% rough_closed_x = closed_arr(:, 1);
% rough_closed_y = closed_arr(:, 2);
% 
% closedx = [];
% closedy = [];
% 
% for i = 1:length(rough_closed_x)-1
% 
%     dist = sqrt( (rough_closed_x(i)-rough_closed_x(i+1))^2 + (rough_closed_y(i)-rough_closed_y(i+1))^2 );
%     nsteps = ceil(dist/resolution);
% 
%     new_x = linspace(rough_closed_x(i), rough_closed_x(i+1), nsteps + 1)';
%     new_y = linspace(rough_closed_y(i), rough_closed_y(i+1), nsteps + 1)';
% 
%     if i > 1
%         new_x(1) = [];
%         new_y(1) = [];
%     end
% 
%     closedx = [closedx; new_x];
%     closedy = [closedy; new_y];
% end
% 
% path_x = closedx;
% path_y = closedy;

%% PLOT to check that it's correct

% figure
% plot(path_x, path_y)
% xlabel('x');
% ylabel('y');
% axis equal;
% xlim([-100, 1450]);
% ylim([-100, 950]);

x_final = path_x(end);
y_final = path_y(end);
fs = length(path_x); 

t = linspace(0, 10, fs)';

x_trajectory = timeseries(path_x, t);
x_trajectory.Name = 'x_circle';

x_trajectory_scenario = Simulink.SimulationData.Dataset;
x_trajectory_scenario = x_trajectory_scenario.addElement(x_trajectory, 'Scenario_1');

save('x_trajectory.mat', 'x_trajectory_scenario');

fs = length(path_y); 
t = linspace(0, 10, fs)';

y_trajectory = timeseries(path_y, t);
y_trajectory.Name = 'y_trajectory';

y_trajectory_scenario = Simulink.SimulationData.Dataset;
y_trajectory_scenario = y_trajectory_scenario.addElement(y_trajectory, 'Scenario_1');

save('y_trajectory.mat', 'y_trajectory_scenario');


% initial conditions for x, y, theta:
initial_x = path_x(1);
initial_y = path_y(1);
initial_th = atan2((path_y(2)-path_y(1)),(path_x(2)-path_x(1)));