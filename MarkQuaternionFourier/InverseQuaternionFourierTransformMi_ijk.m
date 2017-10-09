function I = InverseQuaternionFourierTransformMi_ijk(quaternion)
Cirft = ifft2(quaternion(:,:,:,2));
Dirft = ifft2(quaternion(:,:,:,3));
Eirft = ifft2(quaternion(:,:,:,4));
Airft = ifft2(quaternion(:,:,:,1));

I(:,:,:,1) = real(Airft) - (imag(Cirft) + imag(Dirft) + imag(Eirft))/sqrt(3);
I(:,:,:,2) = real(Cirft) + (imag(Airft) + imag(Dirft) - imag(Eirft))/sqrt(3);
I(:,:,:,3) = real(Dirft) + (imag(Airft) - imag(Cirft) + imag(Eirft) )/sqrt(3);
I(:,:,:,4) = real(Eirft) + (imag(Airft) + imag(Cirft) - imag(Dirft))/sqrt(3);

end