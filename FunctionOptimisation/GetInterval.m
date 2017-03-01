function [lowerBound, upperBound, range]  =  GetInterval(interval) 
       lowerBound = interval(1);
       upperBound = interval(2);
       range = upperBound - lowerBound;
       if(range < 0)
         error('Error. \nInterval must have lower bound greater than upper.')
       end
end