function Q = QuaternionFourierTransformMi_ijk(quaternion)

Rrft = fft2(quaternion(:,:,2));
Grft = fft2(quaternion(:,:,3));
Brft = fft2(quaternion(:,:,4));

Q(:,:,:,1) = -(imag(Rrft) + imag(Grft) + imag(Brft))/sqrt(3);
Q(:,:,:,2) = real(Rrft) + (imag(Grft) - imag(Brft))/sqrt(3);
Q(:,:,:,3) = real(Grft) + (imag(Brft) - imag(Rrft))/sqrt(3);
Q(:,:,:,4) =  real(Brft) + (imag(Rrft) - imag(Grft))/sqrt(3);


end