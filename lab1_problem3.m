clearvars

%% Generate a complex phasor and its real/imaginary parts
%these signals are analyzed later in this program

Tsample = 0.01; %sample duration in seconds
Ttotal = 1; %total simulated time in seconds
f = 10; %frequency in Hertz
amplitude = 2;
[s,sr,si,t] = sinusoidalSignalGenerator(Ttotal,Tsample,f,amplitude);

%% Generate the frequencies of the complex phasor used in Fourier Analysis

Nsample = ceil(Ttotal/Tsample); %Number of samples
Fs = 1/Tsample; %Sample rate in Hertz (i.e., in samples/second)

%Total number of frequencies = Nsample in the range -Fs/2 to +Fs/2
FcycleSet = linspace(-Fs/2,Fs/2,Nsample); 

%% Start the Fourier Analysis

% First allocate memory (FOR loop in Matlab works better if memory is pre-allocated)
S = 0*FcycleSet; Sr = S; Si = S; 

amplitude = 1; % use amplitude = 1 of complex phasors used in the analysis
kk = 1; % This is an indexing integer
for f = FcycleSet %do the following for each value of f in FcycleSet
    s_local = sinusoidalSignalGenerator(Ttotal,Tsample,f,amplitude);
    
    S(kk) = dot(s_local,s)/Nsample;
    
    Sr(kk) = dot(s_local,sr)/Nsample;
    
    Si(kk) = dot(s_local,si)/Nsample;
    
    kk = kk + 1;
    
end

%% Plot the results



figure(1); plot(FcycleSet,abs(S),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Complex Phasor: s(t)')

figure(2); plot(FcycleSet,abs(Sr),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Real Part Signal: s_r(t)')

figure(3); plot(FcycleSet,abs(Si),'linewidth',2);
xlabel('Frequency in Hertz'); ylabel('Magnitude'); 
title('Fourier Analysis of Imaginary Part Signal: s_i(t)')


%% Compare the above with the output of Matlab FFT function

S2 = fft(s); S2 = fftshift(S2)/Nsample; 

Sr2 = fft(sr); Sr2 = fftshift(Sr2)/Nsample; 

Si2 = fft(si); Si2 = fftshift(Si2)/Nsample; 

figure(1); hold on; plot(FcycleSet,abs(S2),'r','linewidth',2); grid

figure(2); hold on; plot(FcycleSet,abs(Sr2),'r','linewidth',2); grid

figure(3); hold on; plot(FcycleSet,abs(Si2),'r','linewidth',2); grid

