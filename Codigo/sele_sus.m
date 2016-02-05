function [pop]  = sele_sus(pop,fitn,repro,elite)
% La elite pasa directamente a la siguiente generacion
% para evitar la repeticion
% eso no evita que los otros cromosomas sean selecionados multiples veces
cumfitn = cumsum(fitn(:,:,elite+1:repro));
total = cumfitn(:,:,end);
result = zeros(size(pop));
tam_segmento = total/size(cumfitn,3);
roll = rand().*tam_segmento;
for i=1:1:repro-elite
    %repro-elite punteros equidistantes
    puntero = (i-1)*tam_segmento+roll;
    %Se filtran los valores menores que el random
    %El primero de los que quedan es el objetivo
    k = find(cumfitn>=puntero,1);
    result(:,:,i) = pop(:,:,k+elite);
end
pop(:,:,elite+1:repro) = result(:,:,1:repro-elite);
pop(:,:,repro+1:end) = pop_init(size(pop,1),size(pop,2),size(pop,3)-repro);
end

% sel = ['truncamiento' 'rwsr' 'sus' 'torneo'];