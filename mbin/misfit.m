function [f,g] = misfit(ft,p,theta)

pt = Fp(ft,theta);

f  = .5*norm(pt(:) - p(:)).^2;

g  = DFp(pt-p,-1,sqrt(length(ft)),theta);
