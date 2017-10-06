function Q = QuaternionFourierTransform(quaternion)

Rrft = fft2(quaternion(:,:,2));
Grft = fft2(quaternion(:,:,3));
Brft = fft2(quaternion(:,:,4));

Q(:,:,:,1) = -imag(Rrft);
Q(:,:,:,2) = real(Rrft);
Q(:,:,:,3) = real(Grft) + imag(Brft);
Q(:,:,:,4) = -imag(Grft) + real(Brft);


end