%% Create tones with different frequencies

% Ceren Arslan
% 14/06/2022

clear all; close all; clc; randn('seed',0); rand('seed',0); fprintf('.\n');

%office 
addpath('C:/Users/arslan/Documents/piheycdi/MUSE/tones/wolff_et_all/'); 
addpath ('C:/Program Files/MATLAB/R2022a/tone_generator');
dataout = 'C:/Users/arslan/Documents/piheycdi/MUSE/tones/wolff_et_all/'; 

%in laptop
%addpath('C:/Users/ceren/Desktop/RM Cog/piheycdi/stimuli/tones/');
%dataout = 'C:/Users/ceren/Desktop/RM Cog/piheycdi/stimuli/tones/'; 


%define parameters

fs = 44100;                              % sampling frequency (Hz)
duration = 200;                          % signal duration (ms)
amplitude = 1;                          % pure tone amplitude
% frequency_list = [380, 419, 463, 511, 564, 623, 688, 759, 838, 925, 1022, 1128, 1245, 1375]; % pure tone frequency (Hz)
frequency_list = [270, 381, 540, 763, 1080, 1527, 2159, 3054]; % in steps of half an octave = previous freq*sqrt(2)
phase = pi/16;                          % pure tone phase (rad/sec)????????
fade_duration = 20;                     % fade-in and fade-out duration (ms)
N = floor(duration*1E-3*fs);            % signal length (samples)
window = @(N)( chebwin(N,100) );        % analysis window function
fade_window = @(N)( hanning(N).^2 );    % fade-in and fade-out window function handle

    % generate a pure tone
    for i = 1:length(frequency_list)
        [ tone, time ] = tone_generator( fs, duration, amplitude, frequency_list(i), phase, fade_duration, fade_window ); %for tone_generator see
        soundsc(tone,fs,16)                                                                                         % Kamil Wojcicki, UTD, November 2011
        filename = [num2str(frequency_list(i)),'Hz.wav'] ;
        audiowrite([dataout,filename],tone,fs);
    end
% define parameters specific to generation of the mixture of pure tones
amplitudes = ones (1);                  % pure tone amplitudes
phases = [pi/16, pi/16,pi/16,pi/16,pi/16,pi/16,pi/16,pi/16];               % pure tone phase (rad/sec)
fade_durations = [ 20 20 ];             % fade-in and fade-out durations (ms)

% fade-in and fade-out window function handles
fade_windows = { @(N)(hanning(N).^2) @(N)(chebwin(N,100)) };

% generate a mixture of pure tones
tones = tone_generator( fs, duration, amplitudes, frequency_list, phases, fade_durations, fade_windows );
soundsc(tones, fs, 16)
filename = 'mask.wav'; 
audiowrite([dataout,filename],tones,fs);