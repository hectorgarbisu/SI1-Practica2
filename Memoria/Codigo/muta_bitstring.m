function [pop] = muta_bitstring(pop,pmut)
for i = 1:size(pop,3)
    if(rand()<=pmut)
        dim1 = round(rand().*3+1);
        dim2 = round(rand().*11+1);
        pop(dim1,dim2,i) = ~pop(dim1,dim2,i);
    end
end
end
