function [Pop] = pop_init(numcarreteras,numpasos,tampop)
if(nargin)<2
    tampop = numcarreteras;
    Pop = round(rand(4,12,tampop));
else 
    Pop = round(rand(numcarreteras,numpasos,tampop));
end 

end