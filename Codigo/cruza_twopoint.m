function [hijos] = cruza_twopoint(padres)
%progenitores aleatoriamente ordenados
hijos = a_desordena_padres(padres);
numpadres = size(hijos,3);
if mod(numpadres,2)~= 0 %Paridad forzada
    numpadres = numpadres-1;
    hijos(:,:,end) = pop_init(4,12,1);
end
for i = 2:2:numpadres
    hijo1 = hijos(:,:,i-1);
    hijo2 = hijos(:,:,i);
    %linear indexing
    %Se copiann los contenidos para
    %poder usar indexado lineal
    pto1 = floor(rand().*4.*12)+1;
    aux = floor(rand().*4.*12)+1;
    pto2=max(pto1,aux);
    pto1=min(pto1,aux);
    aux = hijo1;
    aux(pto1:pto2) = hijo2(pto1:pto2);
    hijos(:,:,i-1) = aux;
    aux = hijo2;
    aux(pto1:pto2) = hijo1(pto1:pto2);
    hijos(:,:,i) = aux;
end

end
% cruce = ['onepoint' 'twopoint' 'uniforme' 'semiuniforme'];
