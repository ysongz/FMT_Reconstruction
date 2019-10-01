function out=FMTrecon(detector,Gorg,truncnum,lambda,tol,niter)
% detector: detector data
% Gorg: system matrix that stores Green's function
% truncnum: truncation number for SVD preconditioning
% lambda: l1 regularization parameter
% tol: tolerance for l1 recovery
% niter: number of iteration for MLEM
%% SVD preconditioning
[U,S,V]=svd(Gorg);
A=V(:,1:truncnum);
A=A';
St=S(1:truncnum,1:truncnum);
Ut=U(:,1:truncnum);
y=pinv(St)*Ut'*(detector);
%% sparse recon
x=FISTA(A,y,tol,lambda); % sparse reconstruction with FISTA
%% MLEM
pos=find(x<0);
x(pos)=0;
out=MLEM(Gorg,detector,x,niter); % MLEM with sparse initial guess
end