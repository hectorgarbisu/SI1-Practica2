function [hijos] = cruza_onepoint(padres)
%progenitores aleatoriamente ordenados
hijos = a_desordena_padres(padres);
numpadres = size(hijos,3);
if mod(numpadres,2)~= 0 %Paridad forzada
    numpadres = numpadres-1;
    hijos(:,:,end) = pop_init(4,12,1);
end
for i = 2:2:numpadres
    dim1 = round(rand().*3+1);
    dim2 = round(rand().*11+1);
    %No es exactamente lineal, pero es parecido
    hijos(1:dim1,1:dim2,i) = hijos(1:dim1,1:dim2,i-1);
    hijos(1:dim1,1:dim2,i-1) = hijos(1:dim1,1:dim2,i);
end

end
% cruce = ['onepoint' 'twopoint' 'uniforme' 'semiuniforme'];
