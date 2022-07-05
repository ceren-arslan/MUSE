

%%%%% Convert visual angle to pixels %%%%%%%

h = 55.88; % Monitor height in cm (22 inch = 55.88 cm)
d = 150; % Distance between monitor and participant in cm
r = 768; % Vertical resolution of the monitor (768)
size_in_deg = 6.5; % The stimulus size in pixels

% Calculate the number of degrees that correspond to a single pixel. This will
% generally be a very small value, something like 0.03.
deg_per_px = rad2deg(atan2(.5*h, d)) / (.5*r); 

%Calculate the size of the stimulus in pixels
size_in_px = size_in_deg / deg_per_px;


%%% superimpose images to create a mask %%%
addpath('C:/Users/arslan/Documents/piheycdi/MUSE/gabors/gabors_3/');
image_path = 'C:/Users/arslan/Documents/piheycdi/MUSE/gabors/gabors_3/';
gabor_1 = imread('gabor-11.25.png');
gabor_2 = imread('gabor-33.75.png');
gabor_3 = imread('gabor-56.25.png');
gabor_4 = imread('gabor-78.75.png');
gabor_5 = imread('gabor-101.25.png');
gabor_6 = imread('gabor-123.75.png');
gabor_7 = imread('gabor-146.25.png');
gabor_8 = imread('gabor-168.75.png');


% if you simply take the average of all the images, then you end up with equal weights

% assuming all images have the same size and class

outpict = cat(8,gabor_1,gabor_2,gabor_3,gabor_4,gabor_5,gabor_6,gabor_7,gabor_8);
outpict = cast(mean(outpict,8),class(gabor_1));
% each image has a weight of 0.12
imshow(outpict)

%%

grayImage = zeros(236,236, 'uint8');
imshow(grayImage, []);

