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

T = input('Enter Translation matrix'); %recive T06 desired (transformayion matrix)
Q = robot.ikine(T); %solve inverse kinematic
Theta=Q(1,2:7)
