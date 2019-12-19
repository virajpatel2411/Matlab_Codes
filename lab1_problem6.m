clearvars
close all;
clc;


Tsample = 0.01; %sample duration in seconds
Ttotal = 100; %total simulated time in seconds

fSet = [5 10 15 20 25 30]; %frequency in Hertz
amplitude_set = [6 5 4 3 2 1];
for kk = 1:6
    [s_ref_kk,sr_ref_kk,si_ref_kk,t] = sinusoidalSignalGenerator...
        (Ttotal,Tsample,fSet(kk),amplitude_set(kk));
    if kk == 1
        s_ref = s_ref_kk; sr_ref = sr_ref_kk; si_ref = si_ref_kk;
    else
        s_ref = s_ref + s_ref_kk; 
        sr_ref = sr_ref + sr_ref_kk; 
        si_ref = si_ref + si_ref_kk;
    end
end

plot(s_ref); figure(2); plot(t,sr_ref); figure(3); plot(t,si_ref);
%% Generate the frequencies of the complex phasor used in Fourier Analysis

Nsample = ceil(Ttotal/Tsample); %Number of samples
Fs = 1/Tsample; %Sample rate in Hertz (i.e., in samples/second)

%Total number of frequencies = Nsample in the range -Fs/2 to +Fs/2
FcycleSet = linspace(-Fs/2,Fs/2,Nsample); 

%% Perform the Fourier Analysis

S = myFourierTransform(s_ref,FcycleSet,Ttotal,Tsample);
Sr = myFourierTransform(sr_ref,FcycleSet,Ttotal,Tsample);
Si = myFourierTransform(si_ref,FcycleSet,Ttotal,Tsample);


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


