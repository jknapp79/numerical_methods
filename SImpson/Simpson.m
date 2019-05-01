function I = Simpson(x,y)
%By: Justyn Knapp Date:4/15/19 
%The Simpsons 1/3 rule is implemented as a means of integrating the values
%of y at position x. If there is an odd number of segments the trapezoid
%rule will be used for the last segment. 
%   Inputs: x the independant variable, y the dependant variable. 
%   Outputs: I which is the integral of the data, or summnation of all the
%   intervals

%% Error Check and Defining variable

%Checks if the number of input arguements is equal to 2
if nargin > 2 || nargin <2
    error('This function requires only an x and y input')
end

%Checks that the same number of values is in each of the input arguements
if length(x) ~= length(y)
    error('The number of x inputs must equal the number of y inputs')
end

%Checks that the intervals of x are evenly spaced, if they aren't it will
%spit an error
interval = linspace(x(1),x(length(x)),length(x));
for i = 1:length(x)
   if x(i) ~= interval(i)
       error('The x values must be evenly spaced')
   end
end
       
%Defines the variables that will be used later in the function 
I = 0;
sum_even = 0;
sum_odd = 0;
h = abs(x(2)-x(1));
intervals = length(x)-1;
segments = 0;

%Checks if the number of intervals is odd or even, if its odd it defines
%segments as 1
if rem(intervals,2)==0
    segments = 0;
else 
    segments = 1;
end

%% Simpsons Rule 1/3 rule

%Sum of all the even terms using Simpsons rule and multiplying by 4
for j = 2:2:length(x)-1-segments
    sum_even = y(j) + sum_even;
end

%Sum of all the odd terms using simpsons rule and multiplying by 2
for k = 3:2:length(x)-2-segments
    sum_odd = y(k) + sum_odd;   
end

%Calculates the integral using simpsons 1/3 rule 
I = (h/3)*(y(1) + 4*sum_even + 2*sum_odd + y(length(y)-segments));


%% Trap Rule
%If the segments is odd the trapezoid rule will be used on the last
%segment
if segments == 1
    I = I + h*((y(length(y))+y(length(y)-1))/2);
    fprintf('\n The trapezoid rule was used on the last interval \n');
end


end