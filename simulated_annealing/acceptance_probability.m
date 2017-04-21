function[ap]=acceptance_probability(old,new,T)
k=(old-new)/T;
ap=exp(k);
end