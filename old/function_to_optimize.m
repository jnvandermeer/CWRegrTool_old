function [out out2] = function_to_optimize(y,in,in0)


out = 1-prod(y./my_poly(1:numel(y),in.*in0));
% out = sum(y-my_poly(1:numel(y),in.*in0));

out2 = my_poly(1:numel(y),in.*in0);

