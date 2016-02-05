function [pop] = muta_boundary(pop,pmut)
for i = 1:size(pop,3)
    if(rand()<=pmut)
        %de 1 a 4
%         dim1 = round(rand().*3+1);
        %de 1 a 11
        dim2 = round(rand().*10+1);
        %esta version no intercambia genes de diferentes columnas
        pop(:,[dim2 dim2+1],i) = pop(:,[dim2+1 dim2],i);
    end
end
end
