mostrar = false;
ngeneraciones = 10;
tampop = 60;
repro = 42; 
elite = 1;
pmut = 0.1;
sel = {'truncamiento','rwsr','sus','torneo'};
cruce = {'onepoint' 'twopoint' 'uniforme'};
puntuacion = [];
contador = 1;
for s=sel
    selo=s{1};
for c=cruce
    cruceo=c{1};
    pmut=0.1;
    mutao = 'boundary';
    SGA2
    puntuacion = [puntuacion;contador, s, c, mutao, best(end), avrg(end)]
    contador = contador+1;
    mutao = 'bitstring';
    SGA2
    puntuacion = [puntuacion;contador, s, c, mutao, best(end), avrg(end)]
    contador = contador+1;
    pmut=0.6;
    mutao = 'hipermut';
    SGA2
    puntuacion = [puntuacion;contador, s, c, mutao, best(end), avrg(end)]
    contador = contador+1;
end
end

