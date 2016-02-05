function [pop] = muta_hipermut(pop,pmut,age,ngen)
    %La probabilidad de mutacion es mayor al principio
    %u.age/ngen[1..1/ngen] -> u.pmut[pmut..0]
    %La probabilidad decrece uniformemente entre pmut y 0
    %pmut debe ser un valor mayor que en otras mutaciones
    pmut = pmut*(1-age/ngen);
    pop = muta_bitstring(pop,pmut);
end
