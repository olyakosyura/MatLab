clc; clear;
F = @(x)x.^2./((x.^2+1).^2);
Q = quad(F,0,1,0.001); 
    xgr=0:0.05:1;
    ygr=F(xgr);
plot(xgr,ygr);
grid on;
xlabel('x');
ylabel('y');