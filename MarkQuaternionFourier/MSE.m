function err = MSE(Image1, Image2)
[M, N] =  size(Image1);
e = (Image1 - Image2).^2;
if size(e,3) == 3
    err = sum(sum(sum(e)))/(M*N);
else
    err = sum(sum(e))/(M*N);
end
end