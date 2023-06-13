# Audio-Steganography-MATLAB

## Overview
Steganography is the art and science of hiding information in a way that the presence of the information itself is concealed. In the digital era, steganography has evolved to encompass various techniques, including audio steganography, which involves concealing secret data within audio files without raising suspicion.
The techniques of audio steganography are then explored, covering methods such as LSB substitution.
The presentation delves into the types of audio files commonly used for steganography, including WAV, MP3, FLAC, and AAC, highlighting considerations and challenges specific to each format. The embedding and extraction process is also elucidated, providing insights into how secret data can be embedded within an audio file and subsequently extracted.
## Goals
Create or generate a random noise signal
Encrypt text data in it
Decrypting the audio file and text data

## Tools used
### Matlab
- We are using matlab for this to run the code and see the audio spectrum and text file.
### Audacity
- Audacity used to play the .wav file

## Potential of the project in real life
1. Our project can be best used in military for sending sensitive data without getting detected to anyone.
2. Not only military but we can also save secret passwords.
3. By updating and deep research we can encrypt the text in movie songs etc.
4. Not only text we can also save images in audio signals and can be seen in  audi spectrogram
## Workflow
![workflow](https://github.com/manoj1749/Audio-Steganography-MATLAB/assets/83648898/f615d913-7073-4dde-8c3d-ae57edba1319)


## Output :
### Steganography.m : 
Output of encrypted and decrypted file in sender side view
![steganography](https://github.com/manoj1749/Audio-Steganography-MATLAB/assets/83648898/57956e0f-a5a4-41ad-a1f7-9aeb75614746)

### Audio signal and spectrogram :
![audiosig](https://github.com/manoj1749/Audio-Steganography-MATLAB/assets/83648898/13771d79-2b77-423d-8a48-0cd3dbcb27cc)

### Verify.m:
Output after decrypting the audio signal in receiver side view :
![verifycode](https://github.com/manoj1749/Audio-Steganography-MATLAB/assets/83648898/de1000a3-9a9e-4db6-8889-ac88d6861e63)

If we tried to decrypt without the right process the out text will looks like this
![text](https://github.com/manoj1749/Audio-Steganography-MATLAB/assets/83648898/beb47374-27b5-4234-a3d1-f69f4640d191)


## Code Explanation

Here's an explanation of the code and the process:
1. Generate a random audio signal:
The code begins by defining the sample rate, fs (44100 Hz), and the duration of the audio signal, duration (5 seconds). The time vector t is created using the sample rate and duration. The random audio signal is generated using the rand function, which generates random numbers between 0 and 1. This signal generation method can be replaced with the desired method.
2. Convert the secret message to binary:
The secret message is provided as a string, secretMessage. The dec2bin function is used to convert each character of the message to an 8-bit binary representation. The resulting binary representation is reshaped into a column vector, secretMessageBinary, for easier processing.
3. Check if the audio signal is large enough:
The code checks if the number of required samples for the secret message is greater than the number of samples in the audio signal. If so, it raises an error indicating that the audio signal is too short to hide the message.
4. Scale the audio signal:
The maximum absolute value of the original audio signal is determined using the max function. The signal is then scaled to the range of [-32767, 32767], which is the range of 16-bit signed integers. The scaled signal is converted to 16-bit signed integers using the int16 function.
5. Modify the audio samples to hide the secret message:
The code iterates through each required sample for the secret message. For each sample, it retrieves the current value from the modified signal. The LSB (least significant bit) of the sample is modified using the bitset function. The LSB is replaced with the corresponding bit from the secret message binary. The modified sample is then updated in the modified signal.
6. Save the modified audio signal as a WAV file:
The modified signal is converted back to the range of [-1, 1] by dividing it by the maximum value of a 16-bit signed integer. The audiowrite function is used to save the modified signal as a WAV file with the specified sample rate and 16 bits per sample.
7. Plot the LSB of each sample:
The code plots the LSB values of the original audio signal in blue and the modified audio signal in red. It uses the bitget function to extract the LSB of each sample from the original and modified signals. The resulting LSB values are plotted against time using the plot function.
8. Display the hidden text within the figure:
The secret message is displayed within the figure at the beginning of the time axis using the text function. It appears in blue color and has a font size of 12.
9. Display completion message and file path:
The code displays a completion message indicating that the audio steganography process is complete. It also displays the file path where the modified audio file has been saved.

The resulting WAV file (message.wav) contains the modified audio signal with the hidden message. The LSB plot and displayed text allow visual verification of the hidden message.

## Code and Files: 
- https://github.com/manoj1749/Audio-Steganography-MATLAB
## References:
- https://www.researchgate.net/publication/288838581_Magic_Random_Bits_LSB_Audio_Steganography_Matlab_Code
- https://www.researchgate.net/publication/369708559_Audio_Steganography_Method_Using_Least_Significant_Bit_LSB_Encoding_Technique
- https://www.researchgate.net/publication/237609069_Steganalysis_of_LSB_Steganography_in_wav_Audio
