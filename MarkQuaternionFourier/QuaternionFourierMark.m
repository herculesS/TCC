f = createQuaternion('splash.tiff');
fr = f;
temp = imread('unb_mark.tif');
temp = imresize(temp,.5);

imwrite(temp, 'Mark_32.tif');
scrambled_mark = arnold(temp,5);
figure(1);
imshow(scrambled_mark);

ia = iarnold(scrambled_mark,5);
figure(2);
imshow(ia);



image_size = size(f(:,:,:,2));
mark_size = size(scrambled_mark);

num_of_blocks_mark = mark_size(:,1)*mark_size(:,1)/4;
num_of_blocks_image = image_size(1,1)*image_size(1,2)/64;
num_of_reps = uint8(num_of_blocks_image / num_of_blocks_mark);
delta = 450;

P = 1;
Q = 1;
for M = 1:8:image_size(1,:)
    for N = 1:8:image_size(:,1)
       Bk = f(M:M+7,N:N+7,:,:);
       wk = scrambled_mark(P:P+1,Q:Q+1);
       Bkt = QuaternionFourierTransform(Bk);
       A = Bkt(:,:,:,1);
       
       if wk(1,1) > 0
           A(2,2) = 2*delta*round(A(2,2)/(2*delta)) + delta/2;
       else
           A(2,2) = 2*delta*round(A(2,2)/(2*delta)) - delta/2;
       end
        if wk(1,2) > 0
           A(2,3) = 2*delta*round(A(2,3)/(2*delta)) + delta/2;
       else
           A(2,3) = 2*delta*round(A(2,3)/(2*delta)) - delta/2;
        end
        if wk(2,1) > 0
           A(3,2) = 2*delta*round(A(3,2)/(2*delta)) + delta/2;
       else
           A(3,2) = 2*delta*round(A(3,2)/(2*delta)) - delta/2;
        end
        if wk(2,2) > 0
           A(3,3) = 2*delta*round(A(3,3)/(2*delta)) + delta/2;
       else
           A(3,3) = 2*delta*round(A(3,3)/(2*delta)) - delta/2;
        end
       
       A(7,7) = -A(3,3);
       A(7,8) = -A(3,2);
       A(8,7) = -A(2,3);
       A(8,8) = -A(2,2);
       
       Bkt(:,:,:,1) =  A;
       
       fr(M:M+7,N:N+7,:,:) = InverseQuaternionFourierTransform(Bkt);
       
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
imwrite(Ir, 'splash_marked_image.jpg');


figure(1); imshow(uint8(Ir));
