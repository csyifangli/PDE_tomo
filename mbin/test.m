%size
n = 101;

% create phantom
f = zeros(n);
[ii,jj] = ndgrid(1:n);
f(abs(ii-51) + abs(jj-51)<40) = 1;
f((ii-41).^2 + (jj-51).^2<10^2) = 0;
f = f(:);

% get operator
A = getA(n,pi/2);

% field
u = A\f;

% data
theta = linspace(0,2*pi,51);
p     = Fp(f,theta);

% imaging
f1 = DFp(p,-1,n,theta);

% inversion
fh = @(x)misfit(x,p,theta);
f2 = mylbfgs(fh,0*f);

% plot
figure(1);
subplot(2,3,1);imagesc(reshape(f,n,n),[0 1]);
subplot(2,3,2);imagesc(reshape(u,n,n),[-1 1]);
subplot(2,3,3);imagesc(p,[-1,1])
subplot(2,3,4);imagesc(reshape(f1,n,n),[-1,1])
subplot(2,3,5);imagesc(reshape(f2,n,n),[-1,1])