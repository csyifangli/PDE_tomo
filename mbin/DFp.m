function output = DFp(input,mode,n,theta)


Sa = zeros(1,n); Sa(1) = 1; 
Sb = zeros(1,n); Sb(end) = 1; 
S  = [kron(speye(n),Sa);kron(Sa,speye(n));kron(speye(n),Sb);kron(Sb,speye(n))];

% p  = S*inv(Ak)*f
% dp = S*inv(Ak)*df
% df = inv(Ak)'*S'*dp

if mode > 0
	for k = 1:length(theta)
		Ak = getA(n,theta(k));
		uk = Ak\input;
		output(:,k) = S*uk;
	end
else
	input  = reshape(input,size(S,1),length(theta));
	output = zeros(n*n,1);
	for k = 1:length(theta)
		Ak = getA(n,theta(k));
		vk = (Ak')\(S'*input(:,k));
		output = output + vk;
	end
end