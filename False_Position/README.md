# False Position Algorithm
### BY: Justyn Knapp

####  INPUTS: func (the function being evaluated by the user), xl (the lower guess of the root), xu (the upper guess of the root), es (the error that the user wants the root to be close to), maxiter (the maximum number of iterations to be used)
####  OUTPUTS: root (approximate value of root on the x-axis), fx (the approximate value of the root on the y-axis), ea (is the approximate error), iter (the number of iterations of false position in order to get root).

###### NOTE: If there are less than 3 input arguements the algorithm will spit out an error. If there are 3 input arguements max iter will default to 200 and es will defailt to 0.0001. If there are 4 input arguements max iter will default to 200.

#### PURPOSE: The purpose of this algorithm is to approximate a root of a given function. This algorithm uses the false position in order to get apprixmations or estimates that are closer and closer to the true root.
