f = createQuaternion('splash_marked_image.jpg');

image_size = size(f(:,:,:,2));
Mark = uint8(zeros(32,32));
delta = 450;

P = 1;
Q = 1;
for M = 1:8:image_size(1,:)
    for N = 1:8:image_size(:,1)
         Bk = f(M:M+7,N:N+7,:,:);
         Bkt = QuaternionFourierTransform(Bk);
         A = Bkt(:,:,:,1);
         
         if A(2,2) - 2*delta*round(A(2,2)/(2*delta)) > 0
             Mark(P,Q) = Mark(P,Q) + 1;
         end
         if A(2,3) - 2*delta*round(A(2,3)/(2*delta)) > 0
             Mark(P,Q+1) = Mark(P,Q+1) + 1;
         end
         if A(3,2) - 2*delta*round(A(3,2)/(2*delta)) > 0
             Mark(P+1,Q) = Mark(P+1,Q) + 1;
         end
         if A(3,3) - 2*delta*round(A(3,3)/(2*delta)) > 0
             Mark(P+1,Q+1) = Mark(P+1,Q+1) + 1;
         end
         
         
         
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
        if Mark(i,j) >= 8
            Mark(i,j) = 1;
        else
            Mark(i,j) = 0;
        end
    end
end
Mark =  iarnold(Mark,5);
imwrite(logical(Mark),'splash_mark.tif');
imshow(255*Mark);