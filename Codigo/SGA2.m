%% Metaparámetros
mostrar = true;
% Numero de generaciones
ngeneraciones = 10;
% Tamaño de la poblacion
tampop = 10;
% Cantidad de individuos reproductores
repro = 8; 
% elitismo
elite = 1;
% probabilidad de mutacion
pmut = 0.1;
% metodo de seleccion
% sel = ['truncamiento' 'rwsr' 'sus' 'torneo'];
selo = 'sus';
% metodo de cruce
% cruce = ['onepoint' 'twopoint' 'uniforme' 'semiuniforme'];
cruceo = 'onepoint';
% metodo de mutacion
% muta = ['bitstring' 'boundary' 'hipermut']
mutao = 'bitstring';
% metodo de escalado
% esca = ['lineal' 'sigma' 'boltzman' 'lrank' 'nrank' 'pnrank'];
escao = 'lineal';
% Registro
best = [];
avrg = [];
%% Inicialización
% Cromosomas
pop = pop_init(4,12,tampop);    
% iv = zeros(1,size(pop,3)); %vector de indices
%% 
if mostrar
    tic
end
for i=1:1:ngeneraciones
    %% Calculo de fitness
    fitn = fitness(pop,0);
    [fitn,iv] = sort(fitn,'descend');
    pop = pop(:,:,iv);
    %% Selección
    pop = sele(pop,fitn,repro,elite,selo,i,ngeneraciones);
    %% Cruce
    pop = cruza(pop,repro,cruceo,elite);
    %% Mutación
    pop = muta(pop,pmut,mutao,i,ngeneraciones);
    %% Recopilacion
%     [i fitn(1)]
%     pop(:,:,i)
    if mostrar
        [i fitn(1) fitn(2) fitn(3)]
    end
    best = [best fitn(1)];
    avrg = [avrg mean(fitn)];
end
%%
% Muestra resultados
if mostrar
    plot(1:ngeneraciones,best,'r-',1:ngeneraciones,avrg,'b-');
    grid on
    legend('maximo','media','Location','EastOutside');
    xlabel('generacion')
    ylabel('fitness')
    axis([1 ngeneraciones 0 1]);
    toc
end
%% Fin