

%%%%% Convert visual angle to pixels %%%%%%%

h = 55.88; % Monitor height in cm (22 inch)
d = 150; % Distance between monitor and participant in cm
r = 768; % Vertical resolution of the monitor
size_in_deg = 6.5; % The stimulus size in pixels

% Calculate the number of degrees that correspond to a single pixel. This will
% generally be a very small value, something like 0.03.
deg_per_px = rad2deg(atan2(.5*h, d)) / (.5*r); 

%Calculate the size of the stimulus in pixels
size_in_px = size_in_deg / deg_per_px;
