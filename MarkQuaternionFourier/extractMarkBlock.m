function Mark = extractMarkBlock(A,Mark,delta, P, Q)

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
end