function parents = a_desordena_padres(parents)
parents = parents(:,:,randperm(size(parents,3)));
end