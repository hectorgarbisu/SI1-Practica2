function [pop]  = sele_rwsr(pop,fitn,repro,elite)
% La elite pasa directamente a la siguiente generacion
% para evitar la repeticion
% eso no evita que los otros cromosomas sean selecionados multiples veces
cumfitn = cumsum(fitn(:,:,elite+1:repro));
result = zeros(size(pop));
for i=1:1:repro-elite
    roll = rand().*cumfitn(:,:,end);
    %Se filtran los valores menores que el random
    %El primero de los que quedan es el objetivo
    k = find(cumfitn>=roll,1);
    result(:,:,i) = pop(:,:,k+elite);
end
pop(:,:,elite+1:repro) = result(:,:,1:repro-elite);
pop(:,:,repro+1:end) = pop_init(size(pop,1),size(pop,2),size(pop,3)-repro);
end
