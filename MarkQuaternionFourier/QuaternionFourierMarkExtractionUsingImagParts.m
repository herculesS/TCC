f = createQuaternion('lena_marked_image.jpg');

image_size = size(f(:,:,:,2));
Mark = uint8(zeros(32,32));
delta = 150;

P = 1;
Q = 1;
for M = 1:8:image_size(1,:)
    for N = 1:8:image_size(:,1)
         Bk = f(M:M+7,N:N+7,:,:);
         Bkt = QuaternionFourierTransformMi_ijk(Bk);
         A = Bkt(:,:,:,1);
         C = Bkt(:,:,:,2);
         D = Bkt(:,:,:,3);
         E = Bkt(:,:,:,4);
         
        Mark = extractMarkBlock(A, Mark,delta, P, Q);
        Mark = extractMarkBlock(C, Mark,delta, P, Q);
        Mark = extractMarkBlock(D, Mark,delta, P, Q);
        Mark = extractMarkBlock(E, Mark,delta, P, Q);
         
         
         
         Q = Q+2;
         if Q > 32
             P = P+2;
             if P>32
                P = 1;
             end
            Q = 1;
         end   
         
    end
end
Marki = Mark;
for i=1:32
    for j=1:32
        if Mark(i,j) >= 32
            Mark(i,j) = 1;
        else
            Mark(i,j) = 0;
        end
    end
end
Mark =  iarnold(Mark,5);
imwrite(logical(Mark),'lena_mark.tif');
imshow(255*Mark);