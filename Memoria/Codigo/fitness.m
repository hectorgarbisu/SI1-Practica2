function [fitn,pop] = fitness(pop,inverso)
%% Definicion del modelo
% Una serie de autómatas celulares
% 4 carreteras con 4 intersecciones
% Antes de cada intersección hay un semáforo
% Los semáforos que operan en la misma intersección
% tienen valores alternativos en cada momento

% Carreteras
% La columna 1 son las entradas
% La columna 14 son las salidas
% Las columnas 4 y 9 son semáforos
% Las columnas 5 y 10 son intersecciones
% Las columnas 6 y 11 son las salidas de las intersecciones
% Se presuponen carreteras vacías al comienzo
[numcarreteras,numpasos,numcromosomas] = size(pop);

% Terreno (se actualiza cada paso)
% 0 = no hay coche; 1 = hay coche
terreno = zeros(4,14,numcromosomas);

% Vector de "semaforos" (se actualiza cada 10 pasos)
% Es una matriz de 4x14 sonde sólo varían 8 celdas.
% A efectos prácticos, todas las celdas normales
% son semáforos en verde

puede_pasar = ones(numcarreteras,14,numcromosomas);
puede_pasar([1 3],4,:) = pop([1 2],1,:); 
puede_pasar([2 4],9,:) = pop([3 4],1,:); 
% Los semaforos cercanos tienen valores alternos
puede_pasar(2,4,:) = ~puede_pasar(3,4,:);
puede_pasar(4,4,:) = ~puede_pasar(2,9,:);
puede_pasar(1,9,:) = ~puede_pasar(4,9,:);
puede_pasar(3,9,:) = ~puede_pasar(1,4,:);

% Colas (se actualiza cada 5 pasos)
cola = ones(4,1,numcromosomas); %Se empieza con un coche en la cola

semstep = 1; % Paso del semaforo 
output = 0;
%% Bucle de 2 horas simuladas
ciclos = 60; % Veces que se repite la secuencia de los cromosomas
for j=1:1:ciclos
%% Bucle de 2 minutos simulados
    for i=1:1:10*numpasos %% 10 segundos por paso
%% Cada 5 segundos la cola incrementa
        if mod(i,5)==0
            cola = cola+1;
        end
%% Cada 10 segundos los semaforos se actualizan
        if mod(i,10)==0
            semstep = mod(semstep,numpasos)+1;
            puede_pasar([1 3],4,:) = pop([1 2],semstep,:); 
            puede_pasar([2 4],9,:) = pop([3 4],semstep,:); 
            % Los semaforos cercanos tienen valores alternos
            puede_pasar(2,4,:) = ~puede_pasar(3,4,:);
            puede_pasar(4,4,:) = ~puede_pasar(2,9,:);
            puede_pasar(1,9,:) = ~puede_pasar(4,9,:);
            puede_pasar(3,9,:) = ~puede_pasar(1,4,:);
        end
%% Cada 1 segundo las celdas se actualizan
% Se suman todos los coches que están a punto de salir
        output = output+sum(terreno(:,14,:));
        [terreno,cola] = actualiza_terreno(terreno,cola,puede_pasar);
%         actualiza_terreno
%         terreno(:,:,1)
%         puede_pasar
    end
end
% metrica = coches por iteración y calle
fitn = output./(10*numpasos*ciclos*4);
% Siendo realistas, el rendimiento maximo de cada calle es 0.5
% y solo la mitad de las calles sacan coches a la vez
fitn = 4*fitn;
if inverso
    fitn=1-fitn;
end
end