clearvars
close all

load lab1_problem5_secretSignal

plot(s); figure(2); plot(t,sr); figure(3); plot(t,si);

%% Generate the frequencies of the complex phasor used in Fourier Analysis

Nsample = ceil(Ttotal/Tsample); %Number of samples
Fs = 1/Tsample; %Sample rate in Hertz (i.e., in samples/second)

%Total number of frequencies = Nsample in the range -Fs/2 to +Fs/2
FcycleSet = linspace(-Fs/2,Fs/2,Nsample); 

%% Perform the Fourier Analysis

S = myFourierTransform(s,FcycleSet,Ttotal,Tsample);
Sr = myFourierTransform(sr,FcycleSet,Ttotal,Tsample);
Si = myFourierTransform(si,FcycleSet,Ttotal,Tsample);


%% Plot the results


figure(4); plot(FcycleSet,abs(S),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Complex Phasor: s(t)'); grid

figure(5); plot(FcycleSet,abs(Sr),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Real Part Signal: s_r(t)'); grid

figure(6); plot(FcycleSet,abs(Si),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Imaginary Part Signal: s_i(t)'); grid

