function [f,g] = misfit(ft,p,theta)

pt = Fp(ft,theta);
f  = .5*norm(p - pt).^2;
g  = DFp(p-pt,-1,length(f),theta);