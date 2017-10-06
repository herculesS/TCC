function I = InverseQuaternionFourierTransform(quaternion)
Cirft = ifft2(quaternion(:,:,:,2));
Dirft = ifft2(quaternion(:,:,:,3));
Eirft = ifft2(quaternion(:,:,:,4));
Airft = ifft2(quaternion(:,:,:,1));

I(:,:,:,1) = real(Airft) - imag(Cirft);
I(:,:,:,2) = imag(Airft) + real(Cirft);
I(:,:,:,3) = real(Dirft) + imag(Eirft);
I(:,:,:,4) = real(Eirft) - imag(Dirft);

end