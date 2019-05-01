function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function will evaluate a root using the false position mehtod
%   When the user inputs at least a function and two bounds. The funciton
%   will evaluate the root using the false position method. The root that
%   is approximated will replace one of the bounds until it gets close
%   enough to satisfy the error. func is the funciton being inputted. xl
%   and xu are the upper and lower values that are being evaluated at. es
%   is the error in percent that the root will satisfy. maxiter is the
%   maximum number of iterations that will be conducted on the function.

%This section will default the number of input arguements. If there is
%anything less than 3 an error will prompt the user to enter more input
%arguements. If there is less than 5 than some of the input arguemetns will
%be defaulted.
if nargin < 3
    error('Enter a valid number of input arguements');
elseif nargin == 3
    es = 0.0001;
    maxiter = 200;
elseif nargin == 4
     maxiter = 200;
end

%In this section the upper and lower bounds are calculated in func, and
%then evaluated for y
yl = double(subs(func(xl)));

yu = double(subs(func(xu)));

%Evaluates if there is a root inside of the bound given by the user
if yl*yu >= 0
      error('There is no root in the given bounds')
end
%In thie while loop, calculations will continue to be done until a root is
%satisfied for the correct es
   iter = 0;
   ea = 100;
   xold = 0;
    while ea > es && iter+1 <= maxiter
    
       xr = xu-(yu*(xl-xu))/(yl-yu);
       yr = double(subs(func(xr)));

        if yr < 0 && yl < 0
            xl = xr;
        elseif yr < 0 && yu < 0
            xu = xr;
        elseif yr > 0 && yl > 0
            xl = xr;
        elseif yr > 0 && yu > 0
            xu = xr;
        end
 %This evaluates the approximate error after the first iteration so there
 %is something to compare to.
        if iter ~= 0
            ea = abs((xr-xold)/xr)*100;
        end
        
 %Stores the previous xr into a new variable so the error can be found in
 %later itterations
        xold = xr;
   
        iter = iter + 1;

    end
%Defines the output values if they haven't already been defined previously.
root = xr;
fx = yr;



end

