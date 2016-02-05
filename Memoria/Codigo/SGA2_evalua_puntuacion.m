%Puntua cada operador de cada una de las tres categorias
puntuacion_matriz = zeros(4+3+3,1);
for fila = 1:36
    best_fitness =  cell2mat(puntuacion(fila,5));
    switch cell2mat(puntuacion(fila,2))
        case 'truncamiento'
            puntuacion_matriz(1) = puntuacion_matriz(1) + best_fitness;
        case 'rwsr'
            puntuacion_matriz(2) = puntuacion_matriz(2) + best_fitness;
        case 'sus'
            puntuacion_matriz(3) = puntuacion_matriz(3) + best_fitness;
        case 'torneo'
            puntuacion_matriz(4) = puntuacion_matriz(4) + best_fitness;  
    end
    switch cell2mat(puntuacion(fila,3))
        case 'onepoint'
            puntuacion_matriz(5) = puntuacion_matriz(5) + best_fitness;
        case 'twopoint'
            puntuacion_matriz(6) = puntuacion_matriz(6) + best_fitness;
        case 'uniforme'
            puntuacion_matriz(7) = puntuacion_matriz(7) + best_fitness;    
    end
    switch cell2mat(puntuacion(fila,4))
        case 'bitstring'
            puntuacion_matriz(8) = puntuacion_matriz(8) + best_fitness;
        case 'boundary'
            puntuacion_matriz(9) = puntuacion_matriz(9) + best_fitness;
        case 'hipermut'
            puntuacion_matriz(10) = puntuacion_matriz(10) + best_fitness;      
    end
end
puntuacion_matriz