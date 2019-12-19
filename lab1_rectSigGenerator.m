function [s,t] = lab1_rectSigGenerator(Ttotal,Tsample,Ton,Toff,amplitude)

Nsamples = ceil(Ttotal/Tsample)+1;
Non = ceil(Ton/Tsample);
Noff = ceil(Toff/Tsample);
N1cycle = Non+Noff;
Ncycles = ceil(Nsamples/N1cycle);

s = reshape(repmat([ones(Non,1); zeros(Noff,1)],1,Ncycles),1,Ncycles*N1cycle);
s = amplitude*s(1:Nsamples);
t = linspace(0,Ttotal,Nsamples);