clearvars; close all;

Tsample = 0.01; %sample duration in seconds
Ttotal = 5; %total simulated time in seconds
Ton = 0.1; %ON duration of rectangule
Toff = 4.9;%OFF duration of rectangle
amplitude = 1;
%make sure that Ton>Tsample and Toff>Tsample
[s,t] = lab1_rectSigGenerator(Ttotal,Tsample,Ton,Toff,amplitude);
figure(1); plot(t,s,'linewidth',2); grid

%% Fourier Analysis

Nsample = ceil(Ttotal/Tsample);
Fs = 1/Tsample; %Sample rate in Hertz (i.e., in samples/second)
%Frequencies used for Fourier Analysis
%Total number of frequencies = Nsample in the range -Fs/2 to +Fs/2
FcycleSet = linspace(-Fs/2,Fs/2,Nsample); 
S = myFourierTransform(s,FcycleSet,Ttotal,Tsample); %using home-grown function
S2 = fftshift(fft(s))/Nsample; %using Matlab's fft function

%% Plot the results

figure(2); plot(FcycleSet,abs(S),'linewidth',2); 
hold on; plot(FcycleSet,abs(S2(1:Nsample)),'r','linewidth',2); grid

