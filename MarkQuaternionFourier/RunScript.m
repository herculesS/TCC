function RunScript(imageName)
i = 1;
for delta = 10:10:1000

QuaternionFourierMark(strcat('ImageSet/',imageName,'.tiff'),'unb_mark_32.tif',20,delta,strcat(imageName,'_marked_image.tiff'),'i_A');
QuaternionFourierMarkExtraction(strcat(imageName,'_marked_image.tiff'),delta,20,strcat(imageName,'_mark.tiff'),'i_A');

[p,s] = psnr(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
mse = MSE(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
splash_i_A_MSEImage(i) = mse;
splash_i_A_PSNRImage(i) = p;
splash_i_A_SNRImage(i) = s;
[p,s] = psnr(uint8(imread('unb_mark_32.tif')),uint8(imread(strcat(imageName,'_mark.tiff'))));
mse = MSE(uint8(imread('unb_mark_32.tif')), uint8(imread(strcat(imageName,'_mark.tiff'))));
splash_i_A_MSEMark(i) = mse;
splash_i_A_PSNRMark(i) = p;
splash_i_A_SNRMark(i) = s;

QuaternionFourierMark(strcat('ImageSet/',imageName,'.tiff'),'unb_mark_32.tif',20,delta,strcat(imageName,'_marked_image.tiff'),'ijk_A');
QuaternionFourierMarkExtraction(strcat(imageName,'_marked_image.tiff'),delta,20,strcat(imageName,'_mark.tif'),'ijk_A');

[p,s] = psnr(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
mse = MSE(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
splash_ijk_A_MSEImage(i) = mse;
splash_ijk_A_PSNRImage(i) = p;
splash_ijk_A_SNRImage(i) = s;
[p,s] = psnr(uint8(imread('unb_mark_32.tif')),uint8(imread(strcat(imageName,'_mark.tif'))));
mse = MSE(uint8(imread('unb_mark_32.tif')), uint8(imread(strcat(imageName,'_mark.tif'))));
splash_ijk_A_MSEMark(i) = mse;
splash_ijk_A_PSNRMark(i) = p;
splash_ijk_A_SNRMark(i) = s;

QuaternionFourierMarkUsingImagParts(strcat('ImageSet/',imageName,'.tiff'),'unb_mark_32.tif',20,delta,strcat(imageName,'_marked_image.tiff'),'i_A');
QuaternionFourierMarkExtractionUsingImagParts(strcat(imageName,'_marked_image.tiff'),delta,20,strcat(imageName,'_mark.tiff'),'i_A');

[p,s] = psnr(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
mse = MSE(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
splash_i_ACDE_MSEImage(i) = mse;
splash_i_ACDE_PSNRImage(i) = p;
splash_i_ACDE_SNRImage(i) = s;
[p,s] = psnr(uint8(imread('unb_mark_32.tif')),uint8(imread(strcat(imageName,'_mark.tiff'))));
mse = MSE(uint8(imread('unb_mark_32.tif')), uint8(imread(strcat(imageName,'_mark.tiff'))));
splash_i_ACDE_MSEMark(i) = mse;
splash_i_ACDE_PSNRMark(i) = p;
splash_i_ACDE_SNRMark(i) = s;

QuaternionFourierMarkUsingImagParts(strcat('ImageSet/',imageName,'.tiff'),'unb_mark_32.tif',20,delta,strcat(imageName,'_marked_image.tiff'),'ijk_A');
QuaternionFourierMarkExtractionUsingImagParts(strcat(imageName,'_marked_image.tiff'),delta,20,strcat(imageName,'_mark.tif'),'ijk_A');

[p,s] = psnr(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
mse = MSE(imread(strcat('ImageSet/',imageName,'.tiff')),imread(strcat(imageName,'_marked_image.tiff')));
splash_ijk_ACDE_MSEImage(i) = mse;
splash_ijk_ACDE_PSNRImage(i) = p;
splash_ijk_ACDE_SNRImage(i) = s;
[p,s] = psnr(uint8(imread('unb_mark_32.tif')),uint8(imread(strcat(imageName,'_mark.tif'))));
mse = MSE(uint8(imread('unb_mark_32.tif')), uint8(imread(strcat(imageName,'_mark.tif'))));
splash_ijk_ACDE_MSEMark(i) = mse;
splash_ijk_ACDE_PSNRMark(i) = p;
splash_ijk_ACDE_SNRMark(i) = s;


i = i+1;

end
save(strcat(imageName,'Data.mat'));
end