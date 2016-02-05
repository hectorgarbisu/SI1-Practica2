function [pop] = muta(pop,pmut,mutao,gen,ngen)
% muta = ['bitstring' 'boundary' 'hipermut']
if nargin<3
    mutao = 'bitstring';
end
switch mutao
    case 'bitstring'
        pop = muta_bitstring(pop,pmut);
    case 'boundary'
        pop = muta_boundary(pop,pmut);
    case 'hipermut'
        pop = muta_hipermut(pop,pmut,gen,ngen);
    otherwise
        pop = muta_bitstring(pop,pmut);
end

end