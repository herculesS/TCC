i = 1;
for delta = 10:10:1000

QuaternionFourierMarkUsingImagParts('lena_color_512.tif','unb_mark_32.tif',20,delta,'lena_marked_image.jpg');
QuaternionFourierMarkExtractionUsingImagParts('lena_marked_image.jpg',delta,20,'lena_mark.tif');

[p,s] = psnr(imread('lena_color_512.tif'),imread('lena_marked_image.jpg'));
mse = MSE(imread('lena_color_512.tif'),imread('lena_marked_image.jpg'));
MSEImage(i) = mse;
PSNRImage(i) = p;
SNRImage(i) = s;
[p,s] = psnr(uint8(imread('unb_mark_32.tif')),uint8(imread('lena_mark.tif')));
mse = MSE(uint8(imread('unb_mark_32.tif')), uint8(imread('lena_mark.tif')));
MSEMark(i) = mse;
PSNRMark(i) = p;
SNRMark(i) = s;

i = i+1;

end