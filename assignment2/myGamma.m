function [gamma_val] = myGamma(gradient1, gradient2)
    gamma_val = (transpose(gradient1)*gradient1)/(transpose(gradient2)*gradient2);
    return;
end

