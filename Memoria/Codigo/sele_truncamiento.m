function [pop]  = sele_truncamiento(pop,repro,elite)
    pop(:,:,repro+1:end) = pop_init(size(pop,1),size(pop,2),size(pop,3)-repro);
end