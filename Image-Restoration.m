% Exercise 1: Image Restoration (50pts)
clear all

% (1) Download the gray-scale image monument.jpg from the eClass Lab website and read it into MATLAB
% (1) Denote the image as g
g = imread('blurredcar.tiff');
% (1) This will be the first subplot
subplot(2,1,1);
% (1) Determine the size of the image matrix 
[rows columns, numberOfColorChannels] = size(g);
% (1) Use this to calculate the uncompressed image size
sizeim = size(g);
s = dir('blurredcar.tiff');
imshow(g);
title ('blurredcar.tiff (The original image)');
% (1) Denote the size of the image by M x N
N_columns = columns;
M_rows = rows;
% (2) Calculate the 2-D DFT of the matrix using the fft2 function
Calculate_the_Fourier_transform  = fft2 (g,M_rows,N_columns);
% (2) plot the Fourier amplitude spectrum 
Plot_the_magnitude_spectrum = logscale2bytes(Calculate_the_Fourier_transform,1);
The_magnitude_spectrum = fftshift (Plot_the_magnitude_spectrum);
subplot(2,1,2);
imshow (The_magnitude_spectrum, []);
title ('Fourier magnitude spectrum |X(u,v)|');

% (3) Analyze this shade (using imtool MATLAB function) and estimate the length and angle of the filter that caused the degradation.
figure (2);
Analyze = imtool(The_magnitude_spectrum);
len = 27;
theta = 13;
% (4) Using MATLAB function fspecial, generate an appropriate 2-D degradation filter impulse response
% (4) Create a new MATLAB figure, and plot the figures (resulting from steps (4)-(10)) as subplots
subplot(2,1,1);
h = fspecial('motion',len,theta);
H = uint8(scale2bytes(h));
imshow(H);
title ('2-D degradation filter impulse response');
% (5) Calculate the Fourier transfer function 𝐻(𝑢, 𝑣)
% (5) make sure that it has size 𝑀 × 𝑁
% (5) Plot the magnitude spectrum |𝐻(𝑢, 𝑣)|
Calculate_the_Fourier_transform_h  = fft2 (h,M_rows,N_columns);
Plot_the_magnitude_spectrum_h = fftshift (Calculate_the_Fourier_transform_h);
The_magnitude_spectrum_h = logscale2bytes(Plot_the_magnitude_spectrum_h,1);
subplot(2,1,2);
imshow (The_magnitude_spectrum_h);
title ('Fourier magnitude spectrum |H(u,v)|');

% (6) Calculate the inverse filter IF
% (6) Plot the amplitude spectrum of the inverse filter.
figure (3);
IF = 1 ./ Calculate_the_Fourier_transform_h; % 1./ H(U,V)
IF_Spectrum =logscale2bytes(IF,1);
subplot(2,1,1);
imshow (IF_Spectrum);
title ('Magnitude Spectrum Inverse Filter IF');
% (7) Calculate the estimate of the undegraded image f_hat_if from the noisy degraded image g
G = fft2(double(g));
Undergraded_image_f = abs (ifft2 (G.* IF));
subplot(2,1,2);
imshow (scale2bytes(fftshift(Undergraded_image_f)));
title('The undegraded image by using inverse filter');

% (8) Calculate the Weiner filter as follows
% (8) where 𝐾 is a small positive number
% (8) Plot the amplitude spectrum of the Weiner filter for an appropriate value
figure (4);
K = 0.001;
H = Calculate_the_Fourier_transform_h;
W = (1./H) .* (abs(H).^2 ./ (abs(H).^2 + K));
% (8) Calculate the fourier transform
w = fftshift(W); 
imshow(logscale2bytes(abs(w),1));
title ('The amplitude spectrum of the Weiner filter');

% (9) Plot 1-D frequency response of the inverse and Weiner filter
figure (5);
length = 1:600;
Frequency_response_of_the_inverse_filter_1D = abs(IF(226,:));
Frequency_response_of_the_Weiner_filter_1D = abs(w(226,:));
plot (length,Frequency_response_of_the_inverse_filter_1D,length,Frequency_response_of_the_Weiner_filter_1D);
legend('Weiner Fliter', 'Inverse Fliter')
title ('1-D frequency response of the inverse and Weiner filter');

% (10) Calculate the estimate of the undegraded image f_hat_w from the noisy degraded image g
figure (6);
Undergraded_image_w = abs (ifft2 (G.* W));
imshow (scale2bytes(Undergraded_image_w));
title('The undegraded image by using the weiner filter');

% (10)** New Figure to compare the performance of the inverse and Weiner filters
figure(7);
subplot (2,1,1);
G = fft2(double(g));
Undergraded_image_f = abs (ifft2 (G.* IF));
imshow (scale2bytes(fftshift(Undergraded_image_f)));
title('The undegraded image by using inverse filter');

subplot (2,1,2);
Undergraded_image_w = abs (ifft2 (G.* W));
imshow (scale2bytes(Undergraded_image_w));
title('The undegraded image by using the weiner filter');


