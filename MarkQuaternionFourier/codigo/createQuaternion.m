function f = createQuaternion(image)
I = imread(image);
A = zeros(size(I(:,:,1)));
I = double(I);
f = cat(4,A,I(:,:,1),I(:,:,2),I(:,:,3));
end