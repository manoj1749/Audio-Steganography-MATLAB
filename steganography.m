% Audio Steganography using LSB with random audio signal

% Generate a random audio signal
fs = 44100;  % Sample rate (Hz)
duration = 5;  % Duration of the audio signal (seconds)
t = 0:1/fs:duration-1/fs;  % Time vector
signal = rand(size(t));  % Random audio signal (replace with your desired signal generation method)

% Convert the secret message to binary
secretMessage = 'This is an encrypted message';
secretMessageBinary = dec2bin(secretMessage, 8);
secretMessageBinary = secretMessageBinary(:); % Convert to column vector

% Check if the audio signal is large enough to hide the message
numSamples = numel(signal);
numRequiredSamples = numel(secretMessageBinary);
if numRequiredSamples > numSamples
    error('The audio signal is too short to hide the message.');
end

% Scale the audio signal to the range of integers
maxValue = max(abs(signal));
scaledSignal = signal * (2^15 - 1) / maxValue;  % Scale the signal to the range of [-32767, 32767]
scaledSignal = int16(scaledSignal);  % Convert to 16-bit signed integers

% Modify the audio samples to hide the secret message
modifiedSignal = scaledSignal;
for i = 1:numRequiredSamples
    sample = modifiedSignal(i);
    modifiedSample = bitset(sample, 1, str2double(secretMessageBinary(i)));
    modifiedSignal(i) = modifiedSample;
end

% Save the modified audio signal as a WAV file
outputFile = 'message.wav';
audiowrite(outputFile, double(modifiedSignal) / (2^15 - 1), fs, 'BitsPerSample', 16);  % Scale back to the range of [-1, 1]

% Plot the LSB of each sample
originalLSB = bitget(int16(signal * (2^15 - 1)), 1);
modifiedLSB = bitget(modifiedSignal, 1);

figure;
subplot(2, 1, 1);
plot(t, originalLSB, 'b');
title('LSB of Original Signal');
xlabel('Time');
ylabel('LSB Value');
ylim([0 1]);

subplot(2, 1, 2);
plot(t, modifiedLSB, 'r');
title('LSB of Modified Signal');
xlabel('Time');
ylabel('LSB Value');
ylim([0 1]);

% Display the hidden text within the figure
text(t(1), 0.5, secretMessage, 'Color', 'blue', 'FontSize', 12);

disp('Audio steganography complete.');
disp(['Modified audio file saved as ', outputFile]);
