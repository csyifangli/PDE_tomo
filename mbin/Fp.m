function p = Fp(f,theta)

n = sqrt(length(f));

Sa = zeros(1,n); Sa(1) = 1; 
Sb = zeros(1,n); Sb(end) = 1; 
S  = [kron(speye(n),Sa);kron(Sa,speye(n));kron(speye(n),Sb);kron(Sb,speye(n))];

for k = 1:length(theta)
	Ak = getA(n,theta(k));
	uk = Ak\f;
	p(:,k) = S*uk;
end