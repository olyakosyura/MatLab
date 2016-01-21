clear;clc;
% �������� �������
f_1=@(x) cosh(pi*x)/2/5;
f_2=@(x) x/5;
f_3=@(x) (x/5).^5;
f_4=@(x) exp(2*x/5).*sinh(pi*x/2/5);
% ���� �������� ��������� �������
f=fopen('dan.txt','r');
str=fgetl(f);                
A=fscanf(f,'%f',[2 20]);
% ����������� ���� �������� ������
fclose(f); 
% ���������� ������ �������� ������
x=A(1,:);
y=A(2,:);
c=[1,1,1];
% ������� 1                
f1=@(c,x) c(1)*f_1(x)+c(2)*f_2(x)+c(3)*f_3(x);
[g1,dy1]=lsqcurvefit(f1,c,x,y);
x1=-10:0.5:10;
y1=f1(g1,x1);
% ������� 2                
f2=@(c,x) c(1)*f_1(x)+c(2)*f_2(x)+c(3)*f_4(x);
[g2, dy2]=lsqcurvefit(f2,c,x,y);
y2=f2(g2,x1);
% ������� 3                
f3=@(c,x) c(1)*f_1(x)+c(2)*f_3(x)+c(3)*f_4(x);
[g3, dy3]=lsqcurvefit(f3,c,x,y);
y3=f3(g3,x1);
% ������� 4                
f4=@(c,x) c(1)*f_2(x)+c(2)*f_3(x)+c(3)*f_4(x);
[g4, dy4]=lsqcurvefit(f4,c,x,y);
y4=f4(g4,x1);
% ������� ���������������� �������
plot(x,y,'ok',x1,y1,x1,y2,x1,y3,x1,y4)
grid on
legend('�������� �������','������ �������','������ �������',...
       '������ �������','��������� �������',0)
% ����������� ����������� � �������
ac=[g1;g2;g3;g4];
s=[dy1,dy2,dy3,dy4];
% ����� ������� �������� ���������������� �������
[sm, nm] = min(s);
str=cat(2,'������ ������� ���������������� ������� -> ',num2str(nm));
fprintf('%s\n\n',str)
fprintf('%s\n','������������ ���������������� �������')
fprintf('%f %f %f\n',ac(nm,:))
