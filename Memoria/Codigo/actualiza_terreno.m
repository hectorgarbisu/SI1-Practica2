function [terreno,cola] = actualiza_terreno(terreno,cola,puede_pasar)
% Terreno(4,14,numcromosomas)
% cola(4,1,numcromosomas)
% sem(8,1,numcromosomas)
M = terreno;
% En la entrada hay coche si en la cola hay coche
% o si hay atasco
% Formula lógica de actualización
% normal = bc+a(¬b+c)
% [5,10] = bc+ad(¬b+c)
% (1) = bc+(cola>0)(¬b+c)
% (14)= a¬b
%[4,9]=b(c+c'+d)+a(¬b+b(c+c'))


% Entrada % c(1) = c(1)*c(2) + cola
terreno(:,1,:) = ((cola(:,1,:)>0).*(~M(:,1,:)|M(:,2,:))) | M(:,1,:).*M(:,2,:);
% Salida % c(14) = c(13)
terreno(:,14,:)= M(:,13,:).*~M(:,14,:);
% Celda normal c(n) = c(n-1)+c(n)*c(n+1)
normal = [2,3,6,7,8,11,12,13];
terreno(:,normal,:) = M(:,normal-1,:).*(~M(:,normal,:)|M(:,normal+1,:)) | (M(:,normal,:).*M(:,normal+1,:));
% Semáforo
% Cada celda semaforo se actualiza individualmente 
% teniendo en cuenta las dos celdas interseccion previas
terreno(1,4,:) = M(1,4,:).*(M(1,5,:)|M(3,10,:)|~puede_pasar(1,4,:));
terreno(1,4,:) = terreno(1,4,:)|(M(1,3,:).*(~M(1,4,:)|M(1,4,:).*(M(1,5,:)|M(3,10,:))));

terreno(2,4,:) = M(2,4,:).*(M(2,5,:)|M(3,5,:)|~puede_pasar(2,4,:));
terreno(2,4,:) = terreno(2,4,:)|(M(2,3,:).*(~M(2,4,:)|M(2,4,:).*(M(2,5,:)|M(3,5,:))));

terreno(3,4,:) = M(3,4,:).*(M(3,5,:)|M(2,5,:)|~puede_pasar(3,4,:));
terreno(3,4,:) = terreno(3,4,:)|(M(3,3,:).*(~M(3,4,:)|M(3,4,:).*(M(3,5,:)|M(2,5,:))));

terreno(4,4,:) = M(4,4,:).*(M(4,5,:)|M(2,10,:)|~puede_pasar(4,4,:));
terreno(4,4,:) = terreno(4,4,:)|(M(4,3,:).*(~M(4,4,:)|M(4,4,:).*(M(4,5,:)|M(2,10,:))));

terreno(1,9,:) = M(1,9,:).*(M(1,10,:)|M(4,10,:)|~puede_pasar(1,9,:));
terreno(1,9,:) = terreno(1,9,:)|(M(1,8,:).*(~M(1,9,:)|M(1,9,:).*(M(1,10,:)|M(4,10,:))));

terreno(2,9,:) = M(2,9,:).*(M(2,10,:)|M(4,5,:)|~puede_pasar(2,9,:));
terreno(2,9,:) = terreno(2,9,:)|(M(2,8,:).*(~M(2,9,:)|M(2,9,:).*(M(2,10,:)|M(4,5,:))));

terreno(3,9,:) = M(3,9,:).*(M(3,10,:)|M(1,5,:)|~puede_pasar(3,9,:));
terreno(3,9,:) = terreno(3,9,:)|(M(3,8,:).*(~M(3,9,:)|M(3,9,:).*(M(3,10,:)|M(1,5,:))));

terreno(4,9,:) = M(4,9,:).*(M(4,10,:)|M(1,10,:)|~puede_pasar(4,9,:));
terreno(4,9,:) = terreno(4,9,:)|(M(4,8,:).*(~M(4,9,:)|M(4,9,:).*(M(4,10,:)|M(1,10,:))));




% Intersección
inter = [5 10];
% Las intersecciones impares son compartidas
% con la inmediatamente superior
terreno(:,inter,:) = puede_pasar(:,inter-1,:).*M(:,inter-1,:).*(~M(:,inter,:)|M(:,inter+1,:)) | (M(:,inter,:).*M(:,inter+1,:));

% Se actualizan las colas si se les ha extraido coches
cola = cola-((cola(:,1,:)>0).*(~M(:,1,:)|M(:,2,:)));

end
