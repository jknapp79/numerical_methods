%Created by: Justyn Knapp
%Created on: 3/29/19
%LU Factorization algorithm

function [L,U,P] = luFactor3X3(A)
%UNTITLED c of this function goes here
%   Detailed explanation goes here

%% Defined the rows and columns of the input matrix, and determined size 
r = 0;
c = 0;
[r,c]=size(A);

%Defined the lower and upper triangle matrix, and sets the values to 0
L = eye(size(A));
U = A;
P = eye(size(A));
P1 = eye(size(A))
%Defined the diagnol of lower matrix to all be 1

for i = 1:r
    L(i,i) = 1
end

%Pivot the highest 




%Checks the dimensions of the matrix to determine if it is a square matrix

if r~=c
    error('Enter a matrix that has the same number of rows as columns.');
end

%% Calculating U
eq1 = A(1,:);
eq2 = A(2,:);
eq3 = A(3,:);

    %Coefficients
    L(2,1) = A(2,1)/A(1,1);
    L(3,1) = A(3,1)/A(1,1);

    %Multiply equations by coefficients, and subtract new equations
    A(2,:) = eq2-(L(2,1)*eq1)
    A(3,:) = eq3-(L(3,1)*eq1)

   %Coefficient of new equations 
    L(3,2) = A(3,2)/A(2,2);
    
    %Mutliplying new equation and redefining eq3
    A(3,:) = A(3,:)-(L(3,2)*A(2,:));
%% Calculating L


U = A;
B = [L]*[U]


end

