function [pop]  = sele_torneo(pop,fitn,repro,elite)
k = randperm(repro-elite);
ksize = size(k);
if(mod(ksize,2)~=0)
   ksize = ksize-1;
end
result = zeros(size(pop));
for i=2:2:ksize
    oponente1f = fitn(k(i)+elite);
    oponente2f = fitn(k(i-1)+elite);
    if(oponente1f<oponente2f)
        result(:,:,i/2) = pop(:,:,k(i)+elite);
    else
        result(:,:,i/2) = pop(:,:,k(i-1)+elite);
    end
end
result = result(:,:,1:end/2);
pop(:,:,elite+1:elite+size(result,3)) = result(:,:,:);
pop(:,:,elite+size(result,3)+1:end) = pop_init(4,12,size(pop,3)-(size(result,3)+elite));
end

% sel = ['truncamiento' 'rwsr' 'sus' 'torneo'];