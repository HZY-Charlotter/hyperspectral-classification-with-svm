%% read ground truth from txt files

close all
clear
clc


load 2013_DFC_contest.mat  

v = [57,30,20]; % RGB channels

color_vect = [0, 205, 0;127, 255, 0;46, 139, 8;0, 139, 0;160, 82, 45;...
    0, 255, 255;255, 255, 255;216, 191, 216;255, 0, 0;139, 0, 0;60, 0, 0;...
    255, 255, 0;238, 154, 0;85, 26, 139;255, 127, 80]; % colors of the different classes


for i = 1:15
    if i == 1
    colors(1:100,1:100,:) = permute(repmat(color_vect(i,:),100,1,100),[1,3,2]);
    end
    colors(100*i+1:100*(i+1),1:100,:) = permute(repmat(color_vect(i,:),100,1,100),[1,3,2]);
end

figure
rgb_full(:,:,1) = imadjust(rescale(double(hyper(:,:,v(1))),1)); % show color image
rgb_full(:,:,2) = imadjust(rescale(double(hyper(:,:,v(2))),1));
rgb_full(:,:,3) = imadjust(rescale(double(hyper(:,:,v(3))),1));
imshow(rgb_full,[]);

figure, imshow(lidar,[],'colormap', jet) % show lidar dataset (measures the elevation (in meters) of the different structures in the image). This can be used as an additional feature.

rgb_int = im2uint8(rgb_full); 
ground_truth = uint8(zeros(size(rgb_full)));

tt = textscan(fopen('grass_healthy.txt'),'%d%d%d%f%f'); % recover information on the classes

% the .txt files containing the training samples are organized this way:
% each row represents one training point
% first column: sample #
% second and third column: vertical and horizontal coordinates of the sample
% fourth and fifth colums: latitude and longitude of the sample (not used
% here)

color = [0, 205, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color; % create rgb image with the training samples
    ground_truth(tt{3}(i),tt{2}(i),:) = color; % create image with only the training samples
end

% do this for each class

tt = textscan(fopen('grass_stressed.txt'),'%d%d%d%f%f');
color = [127, 255, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('grass_synthetic.txt'),'%d%d%d%f%f');
color = [46, 139, 8];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('tree.txt'),'%d%d%d%f%f');
color = [0, 139, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('soil.txt'),'%d%d%d%f%f');
color = [160, 82, 45];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end


tt = textscan(fopen('water.txt'),'%d%d%d%f%f');
color = [0, 255, 255];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('residential.txt'),'%d%d%d%f%f');
color = [255, 255, 255];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('commercial.txt'),'%d%d%d%f%f');
color = [216, 191, 216];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('road.txt'),'%d%d%d%f%f');
color = [255, 0, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('highway.txt'),'%d%d%d%f%f');
color = [139, 0, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('railway.txt'),'%d%d%d%f%f');
color = [60, 0, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('parkinglot1.txt'),'%d%d%d%f%f');
color = [255, 255, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('parkinglot2.txt'),'%d%d%d%f%f');
color = [238, 154, 0];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('tennis_court.txt'),'%d%d%d%f%f');
color = [85, 26, 139];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end

tt = textscan(fopen('running_track.txt'),'%d%d%d%f%f');
color = [255, 127, 80];

for i = 1:length(tt{2})
    rgb_int(tt{3}(i),tt{2}(i),:) = color;
    ground_truth(tt{3}(i),tt{2}(i),:) = color;
end



% show resulting images

figure, imshow(rgb_int,[]);
figure, imshow(ground_truth,[])