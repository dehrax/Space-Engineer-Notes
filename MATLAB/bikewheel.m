function bikewheel(radius, v, angle)
%Takes the radius and simulation and stuff... Look ot the goddamn
%assignment
%Detailed explanation goes here

center = [radius radius];

drawCircle(radius, center);
hold on;

%points = randi(100, 1, 20);
points = linspace(0, 2*pi);
%points
[x, y] = getCirclePoint(radius, points, center);

index = 1;
angles = zeros(1, numel(points));
slopes = zeros(1, numel(points));
for alpha = points

    %Generate point which are displaced 0.1radians from the initial point
    %and calculate the slope between these two. That is the derivative in
    %our point.
    [ point1x, point1y ] = getCirclePoint(radius, alpha-0.1, center);
    [ point2x, point2y ] = getCirclePoint(radius, alpha+0.1, center);
    slope = (point2y-point1y)/(point2x-point1x);

    slopes(index) = slope;
    
    %-pi for angles gives us a positive angle in the opposite direction. It
    %works ;)
    
    %Redistribute alpha to get in the interval [0, 2*pi]
    redAlpha = wrapTo2Pi(alpha);
    %alpha
    %redAlpha
    
    if (pi < redAlpha) && (redAlpha < 2*pi)
       angles(index) = atan(slope)-pi;
    else
       angles(index) = atan(slope);
    end
    %disp('Slope:');
    %disp(slope);
    %disp('Angle:');
    %disp(angles(index));
    
    %Draw the trajectory
    [startX, startY] = getCirclePoint(radius, alpha, center);
    drawTrajectory(angles(index), v, [startX startY]);
    %Set index
    index = index +1;
end

%figure(2);
%plot(linspace(0,100, numel(slopes)), angles);

gcf;
%plot(x, y, 'yp', 'MarkerSize', 25, 'MarkerFaceColor', [1 204/255 0]);

%set(gca, 'color', [0 51/255 153/255]);

%axis([-3*radius 3*radius -radius 3*radius ]);
axis equal
title('Cykelstänk', 'fontsize', 20);
xlabel('Längd [m]', 'fontsize', 18);
ylabel('Höjd [m]', 'fontsize', 18);
hold off;

disp('Done!');

end

