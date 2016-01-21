function f=fxy(x,y)
  f(1)=y(2);
  f(2)=((y(2).^2-y(1).*y(1))/(2*y(1)));
  f=f';
end
