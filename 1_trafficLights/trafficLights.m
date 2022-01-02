%   This program simulates a traffic light
%   every color stands for a second
%   Auther: yssh
%   Date:   2 Jan 2022


%% 2 Yellow Lines
xL = 24:0.1:26;
l1 = 11.5:0.1:13.5;
l2 = 6.5:0.1:8.5;

%% 3 Circles
a = 0: 0.1: 360;
r = 2.5;
xC = r*cosd(a)+25;
y1 = r*sind(a)+20;
y2 = r*sind(a)+30;
y3 = r*sind(a)+40;

%% Draw 2 Rect
pos = [20 15 10 30]; 
rectangle('Position',pos,'Curvature',[0.1 0.1], 'FaceColor','black')
rectangle('Position',[24 5 2 10],'Curvature',[0 0], 'FaceColor', '#808080')

%% Draw 2 Yellow Lines
hold on
plot(xL,l1,'y')

hold on
plot(xL,l2,'y')

%% Draw 3 Circles (tunred off)
hold on
plot(xC,y1);
fill(xC,y1,[0.2 0.2 0.2]);

hold on
plot(xC,y2);
fill(xC,y2,[0.2 0.2 0.2]);

hold on
plot(xC,y3);
fill(xC,y3,[0.2 0.2 0.2]);

axis equal

%% Traffic Lights (12 sec)
for i = 0:11
    if(mod(i,3) == 2)
        fill(xC,y1,'g');
        fill(xC,y2,[0.2 0.2 0.2]);
        fill(xC,y3,[0.2 0.2 0.2]);
    elseif(mod(i,3) == 1)
        fill(xC,y2,'y');
        fill(xC,y1,[0.2 0.2 0.2]);
        fill(xC,y3,[0.2 0.2 0.2]);
    elseif(mod(i,3) == 0)
        fill(xC,y3,'r');
        fill(xC,y1,[0.2 0.2 0.2]);
        fill(xC,y2,[0.2 0.2 0.2]);
    end
    pause(1)
end
