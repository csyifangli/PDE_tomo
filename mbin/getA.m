function A = getA(n,theta)
% discretized differential operator cos(theta) * d/dx + sin(theta) * d/dy
%
% use:
% 	A = getA(n,theta)
% 
% input:
%	n     - number of points in each direction
%   theta - angle
%
% output:
%	A - sparse matrix
%

% gridspacing
h = 1/(n-1);

% difference matrices
if cos(theta)>0
	D1 = (.5/h)*kron(speye(n),spdiags(ones(n,1)*[-1 1],[-1 0],n,n));
else
	D1 = (.5/h)*kron(speye(n),spdiags(ones(n,1)*[-1 1],[0 1],n,n));
end
if sin(theta)>0
	D2 = (.5/h)*kron(spdiags(ones(n,1)*[-1 1],[-1 0],n,n),speye(n));
else
	D2 = (.5/h)*kron(spdiags(ones(n,1)*[-1 1],[0 1],n,n),speye(n));
end

% return 
A = sin(theta)*D1 + cos(theta)*D2;