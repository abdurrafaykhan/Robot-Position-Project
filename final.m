%Part A
%Plot of X vs Time and Y vs Time
load robpos.mat                         %Loads robpos.mat file which contains data points for the position of the robot
t1=robpos(1:61,1);                      %Creates variable t1 that holds the values for time from 0s-60s
x1=robpos(1:61,2);                      %Creates variable x1 that holds the values for x position from 0s-60s
y1=robpos(1:61,3);                      %Creates variable y1 that holds the values for y position from 0s-60s
figure                                  %Creates a new figure to plot "X & Y vs Time" graph
grid on                                 %Creates grid on graph
hold on                                 %Allows multiple graphs to be plotted on same figure
plot(t1,x1)                             %Plots "X vs Time"
plot(t1,y1)                             %Plots "Y vs Time"
legend('X position','Y position');      %Creates legend for the graph
xlabel('Time (s)');                     %Sets label for x axis
ylabel('Position (m)');                 %Sets label for y axis
title('X and Y position vs Time');      %Sets title for the graph

%Plot of X vs Y
figure                                  %Creates a new figure to plot "X & Y Position" graph
plot(x1,y1)                             %Plots "X and Y Position"
xlabel('X position (m)');               %Sets label for x axis
ylabel('Y position (m)');               %Sets label for y axis
title('X and Y position');              %Sets title for the graph

%Plot of Speed vs Time
figure                                          %Creates a new figure to plot "Speed vs Time" graph
grid on                                         %Creates grid on graph
t2=robpos(1:60,1);                              %Creates variable t2 that holds the values for time from 0s-59s
x2=robpos(1:60,2);                              %Creates variable x2 that holds the values for x position from 0s-59s
y2=robpos(1:60,3);                              %Creates variable y2 that holds the values for y position from 0s-59s
x3=robpos(2:61,2);                              %Creates variable x3 that holds the values for x position from 1s-60s
y3=robpos(2:61,3);                              %Creates variable y3 that holds the values for y position from 1s-60s
v1=(sqrt(((x3-x2).^2)+((y3-y2).^2)));           %Equation for speed of the robot
plot(t2,v1)                                     %Plots "Speed vs Time"
xlabel('Time (s)');                             %Sets label for x axis
ylabel('Speed (m/s)');                          %Sets label for y axis
title('Speed vs Time');                         %Sets title for the graph

%Plot of Acceleration vs Time
figure                                          %Creates a new figure to plot "Acceleration vs Time" graph
grid on                                         %Creates grid on graph

t3=robpos(1:59,1);                              %Creates variable t3 that holds the values for time from 0s-58s
x4=robpos(3:61,2);                              %Creates variable x4 that holds the values for x position from 2s-60s
y4=robpos(3:61,3);                              %Creates variable y2 that holds the values for y position from 2s-60s
x5=robpos(2:60,2);                              %Creates variable x5 that holds the values for x position from 1s-59s
y5=robpos(2:60,3);                              %Creates variable y5 that holds the values for y position from 1s-59s
v2=(sqrt(((x4-x5).^2)+((y4-y5).^2)));           %Part of the equation for the acceleration of the robot

x6=robpos(2:60,2);                              %Creates variable x6 that holds the values for x position from 1s-59s
y6=robpos(2:60,3);                              %Creates variable y6 that holds the values for y position from 1s-59s
x7=robpos(1:59,2);                              %Creates variable x7 that holds the values for x position from 0s-58s
y7=robpos(1:59,3);                              %Creates variable y7 that holds the values for y position from 0s-58s
v3=(sqrt(((x6-x7).^2)+((y6-y7).^2)));           %Part of the equation for the acceleration of the robot

a=v2-v3;                                        %Equation for speed of the robot
plot(t3,a)                                      %Plots "Acceleration vs Time"
xlabel('Time (s)');                             %Sets label for x axis
ylabel('Acceleration (m/s^2)');                 %Sets label for y axis
title('Acceleration vs Time');                  %Sets title for the graph



%Part B
%Polyfit for X vs Time and Y vs Time
figure                                          %Creates a new figure to plot "X & Y Approximated Position" graph
grid on                                         %Creates grid on graph
hold on                                         %Allows multiple graphs to be plotted on same figure
p_xvst=polyfit(t1,x1,10);                       %Produces coefficients for a function that would fit the data points the best
xvst=polyval(p_xvst,t1);                        %Generates curve of best fit based off of coefficients from the polyfit function
plot(t1,x1);                                    %Plots "X vs Time" (from code above)
plot(t1,xvst);                                  %Plots Approximated fit for "X vs Time"
p_yvst=polyfit(t1,y1,10);                       %Produces coefficients for a function that would fit the data points the best
yvst=polyval(p_yvst,t1);                        %Generates curve of best fit based off of coefficients from the polyfit function
plot(t1,y1);                                    %Plots "Y vs Time" (from code above)
plot(t1,yvst);                                  %Plots Approximated fit for "Y vs Time"

xlabel('Time (s)');                                               %Sets label for x axis
ylabel('Position (m)');                                           %Sets label for y axis
legend('X pos.','X pos. approx','Y pos.','Y pos. approx');        %Creates legend for the graph
title('X & Y Approximated Position');                             %Sets title for the graph

%Polyfit for Speed vs Time
figure                                          %Creates a new figure to plot "Approximated Speed vs Time" graph
grid on                                         %Creates grid on graph
hold on                                         %Allows multiple graphs to be plotted on same figure
p_vvst=polyfit(t2,v1,7);                        %Produces coefficients for a function that would fit the data points the best
vvst=polyval(p_vvst,t2);                        %Generates curve of best fit based off of coefficients from the polyfit function
plot(t2,v1);                                    %Plots "Speed vs Time" (from code above)
plot(t2,vvst);                                  %Plots Approximated fit for "Speed vs Time"

xlabel('Time (s)');                             %Sets label for x axis
ylabel('Speed (m/s)');                          %Sets label for y axis
legend('V','V approx');                         %Creates legend for the graph
title('Approximated Speed vs Time');            %Sets title for the graph

%Polyfit for Acceleration vs Time
figure                                          %Creates a new figure to plot "Approximated Acceleration vs Time" graph
grid on                                         %Creates grid on graph
hold on                                         %Allows multiple graphs to be plotted on same figure
p_avst=polyfit(t3,a,6);                         %Produces coefficients for a function that would fit the data points the best
avst=polyval(p_avst,t3);                        %Generates curve of best fit based off of coefficients from the polyfit function
plot(t3,a);                                     %Plots "Acceleration vs Time" (from code above)
plot(t3,avst);                                  %Plots Approximated fit for "Acceleration vs Time"

xlabel('Time (s)');                             %Sets label for x axis
ylabel('Acceleration (m/s^2)');                 %Sets label for y axis
legend('A','A approx');                         %Creates legend for the graph
title('Approximated Acceleration vs Time');     %Sets title for the graph



%Part C
%Plot of Circular Path
figure                                          %Creates a new figure to plot "Circular Path" graph
grid on                                         %Creates grid on graph
for t=1:61                                      %Creates a for loop in which coordinates of the robots circular points are calculated every second
    xdist(t)=1.2*cos(t*(pi/30));                %Equation that calculates x coordinate of robot at 1 second intervals multiplied by (pi/30) which is equivalent to (2pi/60)
    ydist(t)=1.2*sin(t*(pi/30))+1.2;            %Equation that calculates y coordinate of robot at 1 second intervals multiplied by (pi/30) which is equivalent to (2pi/60)
end                                             %Ends for loop

plot(xdist,ydist)                               %Plots "Circular Path"
xlabel('X Position (m)');                       %Sets label for x axis
ylabel('Y Position (m)');                       %Sets label for y axis
title('Circular Path');                         %Sets title for the graph

%Plot of X Speed of Circular Path
figure                                          %Creates a new figure to plot "X Speed for Circular Path" graph
grid on                                         %Creates grid on graph
t_dist=0:60;                                    %Domain for the position at x points
x_circ=(1.2*cos(t_dist*(pi/30)));               %Equation that calculates x coordinate of robot at 1 second intervals
vx_circ=diff(x_circ);                           %Creates variable to which the first differences of x_circ are assigned to
t_vel=1:60;                                     %Domain for speed at x points
plot(t_vel,vx_circ)                             %Plots "X Speed for Circular Path"
xlabel('T (s)');                                %Sets label for x axis
ylabel('V (m/s)');                              %Sets label for y axis
title('X Speed for Circular Path');             %Sets title for the graph

%Plot of Y Speed for Circular Path
figure                                          %Creates a new figure to plot "Y Speed for Circular Path" graph
grid on                                         %Creates grid on graph
y_circ=(1.2*sin(t_dist*(pi/30)))+1.2;           %Equation that calculates y coordinate of robot at 1 second intervals
vy_circ=diff(y_circ);                           %Creates variable to which the first differences of y_circ are assigned to
plot(t_vel,vy_circ)                             %Plots "Y Speed for Circular Path"
xlabel('T (s)');                                %Sets label for x axis
ylabel('V (m/s)');                              %Sets label for y axis
title('Y Speed for Circular Path');             %Sets title for the graph

%Plot of X Acceleration for Circular Path
figure                                          %Creates a new figure to plot "X Acceleration for Circular Path" graph
grid on                                         %Creates grid on graph
ax_circ=diff(vx_circ);                          %Creates variable to which the second differences of x_circ are assigned to
t_acc=2:60;                                     %Domain for acceleration at x points
plot(t_acc,ax_circ);                            %Plots "X Acceleration for Circular Path"
xlabel('T (s)');                                %Sets label for x axis
ylabel('A (m/s^2)');                            %Sets label for y axis
title('X Acceleration for Circular Path');      %Sets title for the graph

%Plot of Y Acceleration for Circular Path
figure                                          %Creates a new figure to plot "Y Acceleration for Circular Path" graph
grid on                                         %Creates grid on graph
ay_circ=diff(vy_circ);                          %Creates variable to which the second differences of y_circ are assigned to
plot(t_acc,ay_circ);                            %Plots "Y Acceleration for Circular Path"
xlabel('T (s)');                                %Sets label for x axis
ylabel('A (m/s^2)');                            %Sets label for y axis
title('Y Acceleration for Circular Path');      %Sets title for the graph
