clc
clear 
load('cube_phantom_system_Matrix.mat'); % load stored Green's function
[row,column]=size(Gorg);
% create cube phantom
r=1.5;
[x,y,z]=meshgrid(1:20);
center1=[14,10]; center2=[6,10];
phantom=zeros(20,20,20);
phantom((x-center1(1)).^2+(y-center1(2)).^2<=r^2&z>=6&z<=15)=1;
phantom((x-center2(1)).^2+(y-center2(2)).^2<=r^2&z>=6&z<=15)=1;
%
xt=phantom(:);
detector=Gorg*xt;
detectorn=poissrnd(detector/5e9)*5e9; % add Poisson noise
x2=FMTrecon(detectorn,Gorg,660,1e-2,2e-2,50);
bb=reshape(x2,20,20,20);
figure
imagesc(squeeze(bb(10,:,:)));
colormap jet;
colorbar

