clc; clear; close all;
startup_rvc
global robot

%%DH parameters for linkages
% theta d a alpha
L(1)=Link([0 284.8 0 0],'modified');
L(2)=Link([pi/2 5.4 0 pi/2],'modified');
L(3)=Link([-pi/2 19.2 420.8 0],'modified');
L(4)=Link([0 314.3 0 -pi/2],'modified');
L(5)=Link([0 0 0 pi/2],'modified');
L(6)=Link([0 0 0 -pi/2],'modified');


robot= SerialLink(L,'name','Kinova gen3'); %make robot

theta=zeros(1,6);

   theta(1)=round(input('Enter theta(1)by rad'),4);
   theta(2)=round(input('Enter theta(2)by rad'),4);
   theta(3)=round(input('Enter theta(3)by rad'),4);
   theta(4)=round(input('Enter theta(4)by rad'),4);
   theta(5)=round(input('Enter theta(5)by rad'),4);
   theta(6)=round(input('Enter theta(6)by rad'),4);
   
% determining the position and orientation of the end effector for a given set of joint angles   
robot.fkine(theta) 

robot.plot(theta,'scale',1)

%to adjust the joint angles of the robotic arm using sliders or other interactive controls
robot.teach(theta)
