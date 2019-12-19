clearvars; close all;

Tsample = 0.001; %sample duration in seconds
Ttotal = 10; %total simulated time in seconds
Nsamples = Ttotal/Tsample; %number of simulated samples
% this generates time from 0 seconds to Ttotal seconds 
% in steps of Tsample seconds
% do a web search on Matlab linspace, or type >> help linspace
% to understand what linspace does
t = linspace(0,Ttotal,Nsamples); 
f = 1; %frequency in Hertz = 1/Tcycle
phaseAngle = 2*pi*f*t; 
amplitude = 10;
s = amplitude*exp(1i*phaseAngle); %this is the complex phasor
sr = real(s); %this is cos(phaseAngle)
si = imag(s); %this is sin(phaseAngle)

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
