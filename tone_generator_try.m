
%% Select the best method to generate tones
% Ceren Arslan
% 06.2022
%% First try
Fs = 44100;                                     % Sampling Frequency (44.1 kHZ)
t  = linspace(0, 1, Fs);                        % One Second Time Vector
w = 2*pi*380;                                  % Radian Value To Create Hz Tone
s = sin(w*t);                                   % Create Tone
sound(s, Fs)  

%% Second try (same tone is played consecutively) 
Fs = 8192;                          % Default Sampling Frequency (Hz)
Ts = 1/Fs;                          % Sampling Interval (s)
T = 0:Ts:(Fs*Ts);                   % One Second
Frq = 1000;                         % Tone Frequency
Y = sin(2*pi*Frq*T);                % Tone
Y0 = zeros(1, Fs*2);                % Silent Interval
Ys = [repmat([Y Y0], 1, 4) Y];      % Full Tone With Silent Intervals
soundsc(Ys,Fs);                     % Play Sound

%% 
Fs = 14400;                                     % Sampling Frequency
secs = 10;
t  = linspace(0, secs, Fs*secs+1);              % Time Vector + 1 sample
t(end) = [];                                    % remove extra sample
w = 2*pi*1000;                                  % Radian Value To Create 1kHz Tone
w2 = 2*pi*1440;                                 % Radian Value To Create 1440 Hz Tone
s = sin(w*t);                                   % Create Tone
s2 = sin(w2*t);                                 % Create second Tone
sound([s, s2], Fs)                              % Produce Tone then second Tone As Sound