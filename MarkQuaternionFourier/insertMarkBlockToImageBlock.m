function A = insertMarkBlockToImageBlock(A, delta, wk) 

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
end