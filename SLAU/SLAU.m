clc; clear;
fr=fopen('Lr_04.dan','rt');
  for i=1:10;
    str=fgetl(fr);
    A(i,:)=fscanf(fr,'%f',[1,10]);
    b(i)=fscanf(fr,'%f',[1]);
  end;
  b=b';
fclose(fr);
fw=fopen('Lr_04.res','wt');
  fprintf(fw,'%s\n','������� A');
  for i=1:10
    fprintf(fw,'%5.1f',A(i,:)); fprintf(fw,'\n');
  end;
  fprintf(fw,'%s \n','������ b');
  fprintf(fw,'%5.1f',b); fprintf(fw,'\n');
  x=A\b;
  db=b-A*x; dx=A\db;
  Eotn=norm(dx,inf)/norm(x,inf);
  fprintf(fw,'������ x    Eotn =%8.1e\n', Eotn);
  fprintf(fw,'%9.6f\n',x);
fclose(fw);
fprintf('%s','������� �������� (��. Lr_04.res)');