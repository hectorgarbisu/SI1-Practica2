function pop = sele(pop,fitn,repro,elite,metodo,generacion,maxgen)
if (nargin>4)
    pop = esca(pop,generacion,maxgen);
end
if(nargin<4)
    metodo='truncamiento'
end
if(nargin<3)
    elite = 0
end
if(nargin<2)
    repro = size(pop,3)
end

switch metodo
    case 'truncamiento'
        % Seleccion simple por truncamiento
        pop = sele_truncamiento(pop,repro,elite);
    case 'rwsr'
        pop = sele_rwsr(pop,fitn,repro,elite);
    case 'sus'
        pop = sele_sus(pop,fitn,repro,elite);
    case 'torneo'
        pop = sele_torneo(pop,fitn,repro,elite);
    otherwise 
        metodo
end
end