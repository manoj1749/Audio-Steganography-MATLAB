% Read the modified audio file
[inputSignal, fs] = audioread('message.wav');
inputSignal = int16(inputSignal * (2^15 - 1));  % Scale the signal to the range of 16-bit signed integers

% Extract the LSB of each sample
extractedLSB = bitget(inputSignal, 1);

% Discard any extra elements to make the total number divisible by 8
numSamples = floor(numel(extractedLSB) / 8) * 8;
extractedLSB = extractedLSB(1:numSamples);

% Reshape the extracted LSBs to binary strings
extractedMessageBinary = reshape(char('0' + extractedLSB), 8, []).';

% Convert the binary strings to characters
extractedMessage = char(bin2dec(extractedMessageBinary))';

disp('Extracted secret message:');
disp(extractedMessage);

% Plot the LSB of each sample
originalLSB = bitget(int16(signal * (2^15 - 1)), 1);
modifiedLSB = bitget(modifiedSignal, 1);
extractedLSBPlot = bitget(inputSignal, 1);

figure;
subplot(3, 1, 1);
plot(t, originalLSB, 'b');
title('LSB of Original Signal');
xlabel('Time');
ylabel('LSB Value');
ylim([0 1]);

subplot(3, 1, 2);
plot(t, modifiedLSB, 'r');
title('LSB of Modified Signal');
xlabel('Time');
ylabel('LSB Value');
ylim([0 1]);

subplot(3, 1, 3);
plot(t, extractedLSBPlot, 'g');
title('LSB of Extracted Signal');
xlabel('Time');
ylabel('LSB Value');
ylim([0 1]);

% Display the hidden text within the figure
text(t(1), 0.5, secretMessage, 'Color', 'blue', 'FontSize', 12);
%text(t(1), 0.2, extractedMessage, 'Color', 'green', 'FontSize', 12);

disp('Audio steganography complete.');
disp(['Modified audio file saved as ', outputFile]);
