clearvars; close all;

Tsample = 0.01; %sample duration in seconds
Ttotal = 10; %total simulated time in seconds
Tcycle = 1; %duration of one sinusoidal cycle in seconds
amplitude = 1; %amplitude of the wave (think of this as in volts)
f = 1/Tcycle; %frequency in Hertz = 1/Tcycle
[s,sr,si,t] = sinusoidalSignalGenerator(Ttotal,Tsample,f,amplitude);

%% plot the complex phasor in complex-number plane
figure(1); plot(s); axis equal; grid 
title('Complex Phasor')
legend('s(t)'); xlabel('Real Part s_r(t)'); 
ylabel('Imaginary Part s_r(t)');
% plot sinusoids as function of time
figure(2); plot(t,[sr; si],'linewidth',2); grid; 
title('Sinusoidal Signals: Real and Imaginary Parts')
legend('s_r(t)','s_i(t)'); 
xlabel('Time in Seconds'); ylabel('Voltage');
