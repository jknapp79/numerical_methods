function [L,U,P] = luFactor(A)
%Created by: Justyn Knapp on 3/29/19 This funciton computes the LU factorization of any given square
%coefficient matrix, with partial pivoting.
%   This function will use Gauss elimination in order to eliminate a
%   coefficient. By inputing a matrix into A, the lower triangle, upper
%   triangle, and pivot matrix will all be displayed (L, U, and P). The dimensions of A
%   must be a square matrix.


if nargin > 1
    error('This function can only calculate with one matrix')
end
%% Defined the rows and columns of the input matrix, and determined size 
r = 0;
c = 0;
[r,c]=size(A);

%Defined the pivot, lower and upper triangle matrix, and sets the values to 0
L = eye(size(A));
U = A;
P = eye(size(A));

%Checks the dimensions of the matrix to determine if it is a square matrix

if r~=c
    error('Enter a matrix that has the same number of rows as columns.');
end
%% Defines the pivot and reference pivot vectors
%This allows the elements in the rows that are being pivoted to be
%reference later on
pivot = zeros(r);
reference_piv = zeros(r);


for p = 1:r
    pivot(:,p) = [1:r];
    reference_piv(:,p) = [1:r];
end

%% Calculating U 
%This for loop will complete all of the steps to Gauss Elimination
for a = 1:r-1
    
    %Sets Q and R to the location where the highest absolute value occurs
   [Q,R] = max(abs(U(a:r,:))); 
   
    %checking to see if the highest value is already on the first row, if
    %it isn't pivoting will occut
       if R(a) ~= 1
           P([a R(a)+a-1],:) = P([R(a)+a-1 a],:);
           U([a R(a)+a-1],:) = U([R(a)+a-1 a],:);
   
           if a ~= 1
               pivot([a R(a)+a-1],a) = pivot([R(a)+a-1 a],a);
           end
           
       end
      
   
   %Will calculate the coefficient needed so it can be multiplied later
   for j = a:r-1

        if U(a,a)~=0 
            L(j+1,a) = U(j+1,a)/U(a,a);
        
        
        %Found coefficient from above will be multilied by the row, and
        %subtracted so elimination of a variable can occur
        U(j+1,:) = U(j+1,:)-(L(j+1,a)*U(a,:));
        end          
   end
end
%% Pivoting L matrix

%The for loop will scan for all but the last rows as these will not change
for n= 1:r-2
    %If the new modified pivot matrix isn't equal to the reference matrix,
    %it will enter another for loop to determine which rows to switch
    
     if pivot(n+1,n+1) ~= reference_piv(n+1,n+1)
        for m = n:r

            %if m isn't equal to the row n, it will pivot the rows of the pivot
            %matrix so that it matches up with the pivot matrix
            if m~= n
        
             L([pivot(m,m) m],1:n) = L([m pivot(m,m)],1:n);
            break
            end
        end
    end
end
end