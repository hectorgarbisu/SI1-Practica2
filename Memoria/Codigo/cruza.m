function [pop] = cruza(pop,repro,metodo,elite)
if (nargin<4)
    elite=0
end
if (nargin<3)
    metodo = 'onepoint'
end
if (nargin<2)
    repro=size(pop,3)
end
% cruce = ['onepoint' 'twopoint' 'uniforme' 'semiuniforme'];
switch metodo
    case 'onepoint'
       pop(:,:,elite+1:repro) = cruza_onepoint(pop(:,:,1:repro-elite));
    case 'twopoint'
       pop(:,:,elite+1:repro) = cruza_twopoint(pop(:,:,1:repro-elite));
    case 'uniforme'
       pop(:,:,elite+1:repro) = cruza_uniforme(pop(:,:,1:repro-elite));
    case 'semiuniforme'
       pop(:,:,elite+1:repro) = cruza_semiuiforme(pop(:,:,1:repro-elite));
    otherwise
end
        
end