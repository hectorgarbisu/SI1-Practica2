function [pop] = selecciona(pop,fitn,repro)
% Seleccion simple por truncamiento
pop(:,:,repro+1:end) = pop_init(size(pop,1),size(pop,2),size(pop,3)-repro);
end