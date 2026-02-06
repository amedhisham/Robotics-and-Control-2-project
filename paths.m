%% I have to generate the paths for 3 shapes: Line, Circle, Square.
clear
clc

resolution = 0.1; % size of the steps in the for loops

%% LINE

linex = [];
liney = [];

x_i = 0;
x_f = 100;

y = 0;

for i = x_i:resolution:x_f
    linex = [linex; i];
    liney = [liney, y];
end


%% SQUARE

squarex = [];
squarey = [];

x1 = 0;
y1 = 0;

x2 = 100;
y2 = y1;

x3 = x2;
y3 = 100;

x4 = 0;
y4 = y3;

for i = x1:resolution:x2
    squarex = [squarex; i];
    squarey = [squarey; y1];
end
for i = y2:resolution:y3
    squarex = [squarex; x2];
    squarey = [squarey; i];
end
for i = x3:-resolution:x4
    squarex = [squarex; i];
    squarey = [squarey; y3];
end
for i = y4:-resolution:y1
    squarex = [squarex; x4];
    squarey = [squarey; i];
end


%% CIRCLE

circlex = [];
circley = [];

r = 50;
c = 2*r*pi;

for i = 0:resolution/10:2*pi
    circlex = [circlex; r + cos(i)*r];
    circley = [circley; r + sin(i)*r];
end

%% PLOT to check they look correct
%figure

%plot(squarex,squarey, '-o')
% plot(circlex,circley, '-o')
%plot(linex, liney, '-o')

%xlim([-10 110])
%ylim([-10 110])

fs = length(circlex); 
t = linspace(0, 10, fs)';

x_circle = timeseries(circlex, t);
x_circle.Name = 'x_circle';

x_cirlcle_scenario = Simulink.SimulationData.Dataset;
x_cirlcle_scenario = x_cirlcle_scenario.addElement(x_circle, 'Scenario_1');

save('x_circle.mat', 'x_cirlcle_scenario');

fs = length(circley); 
t = linspace(0, 10, fs)';

y_circle = timeseries(circley, t);
y_circle.Name = 'y_circle';

y_cirlcle_scenario = Simulink.SimulationData.Dataset;
y_cirlcle_scenario = y_cirlcle_scenario.addElement(y_circle, 'Scenario_1');

save('y_circle.mat', 'y_cirlcle_scenario');