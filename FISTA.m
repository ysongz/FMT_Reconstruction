function x=FISTA(A,y,tol,lambda)
% sparse recovery with FISTA algorithm
% A: system matrix
% y: detected signal
% tol: tolerance for stopping criteria 
% lambda: regularization strength
x=zeros(size(A,2),1);
t=1;
L=2*norm(A')*norm(A); % compute Lipschitz constant
w=x;
flag=1;
Ft=0.5*sum((A*x-y).^2)+lambda*sum(abs(x));
n=1;
while(flag)
    xold=x;
    temp=w-1/L*A'*(A*w-y);
    tau=abs(temp)-lambda/L;
    tau(tau<0)=0;
    x=sign(temp).*tau;
    Ftold=Ft;
    Ft=0.5*sum((A*x-y).^2)+lambda*sum(abs(x));
    if(abs(Ft-Ftold)<tol||n==1000)
        flag=0;
    end
    told=t;
    t=0.5*(1+(1+4*t^2)^0.5);
    w=x+(told-1)/t*(x-xold);
    n=n+1;
end
return
    