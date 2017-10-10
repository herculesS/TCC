function QuaternionFourierMarkUsingImagParts(imageToMark, MarkImage, arnoldParam,delta,MarkedImage)
f = createQuaternion(imageToMark);
fr = f;
temp = imread(MarkImage);

imwrite(temp, 'Mark_32.tif');
scrambled_mark = arnold(temp,arnoldParam);

image_size = size(f(:,:,:,2));

P = 1;
Q = 1;
for M = 1:8:image_size(1,:)
    for N = 1:8:image_size(:,1)
       Bk = f(M:M+7,N:N+7,:,:);
       wk = scrambled_mark(P:P+1,Q:Q+1);
       Bkt = QuaternionFourierTransformMi_ijk(Bk);
       A = Bkt(:,:,:,1);
       C = Bkt(:,:,:,2);
       D = Bkt(:,:,:,3);
       E = Bkt(:,:,:,4);
       
       A = insertMarkBlockToImageBlock(A, delta, wk);
       C = insertMarkBlockToImageBlock(C, delta, wk);
       D = insertMarkBlockToImageBlock(D, delta, wk);
       E = insertMarkBlockToImageBlock(E, delta, wk);
       
       
       
       Bkt(:,:,:,1) =  A;
       Bkt(:,:,:,2) =  C;
       Bkt(:,:,:,3) =  D;
       Bkt(:,:,:,4) =  E;
       
       fr(M:M+7,N:N+7,:,:) = InverseQuaternionFourierTransformMi_ijk(Bkt);
       
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
Ir = uint8(cat(3,fr(:,:,:,2),fr(:,:,:,3),fr(:,:,:,4)));
imwrite(Ir, MarkedImage);
end
