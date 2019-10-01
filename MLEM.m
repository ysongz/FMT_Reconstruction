function thetaresult=MLEM(Hinit,g,init,n)
% MLEM algorithm
% Hinit: input system matrix
% g: detector data
% init: initial guess
% n: number of iteration
%% extract columns corresponding to non-zero elements in 'init' since zero elements won't be updated
pos=find(init~=0);
H=Hinit(:,pos);
theta=init(pos);
%%
sn=sum(H,1);
sn=sn';
for i=1:n
    thetak=theta;
    factor=g./(H*thetak+1e-5);
    factor2=factor'*H;
    factor2=factor2';
    theta=theta.*factor2./sn;
    if(rem(i,100)==0)
    disp(i)
    end
    init(pos)=theta;
end
thetaresult=init;
return
