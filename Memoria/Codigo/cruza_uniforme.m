function [hijos] = cruza_uniforme(pop)
padres = a_desordena_padres(pop);
numpadres = size(padres,3);
hijos = padres;
if mod(numpadres,2)~= 0 %Paridad forzada
    numpadres = numpadres-1;
    hijos(:,:,end) = pop_init(4,12,1);
end
for i = 2:2:numpadres
    %cada gen
    %He decidio que cada colummna es un gen
    for gen = 1:1:12
        if(rand()<0.5)
            hijos(:,gen,i-1) =  hijos(:,gen,i);
        end
        if(rand()<0.5)
            hijos(:,gen,i) = hijos(:,gen,i-1);
        end
    end
end
end
% cruce = ['onepoint' 'twopoint' 'uniforme' 'semiuniforme'];
