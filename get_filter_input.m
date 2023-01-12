% get_filter_input.m
% RRI/Prabu

clear;

filename = 'fake_p22.699_acc_ph0.21604.tim'  % fake accelerated-pulsar signal dedispersed time samples. 

 fileID = fopen(filename);
 accelSignal = fread(fileID, 2^23, 'float'); % let's read 8 million samples
 fclose(fileID);

 % Let's pass it htrough CXFT
 temp = fft(accelSignal)/length(accelSignal); 

 % Take only the first half of the FFT output
 FilterInputData = temp(1:(length(temp)/2 + 1));   % data to ve convolved  with 84 filters

% Let's visualize the data
plot(abs(FilterInputData)) % we can see the fundamental and harmonics
                           % we can also observe the bin-spread     
xlabel('fbin (frequency)')
ylabel('Amplitude')
legend('Spectrum')                           

% save FilterInputData 
% FilterInputData can be saved or written out and read for convolution using OpenCL
