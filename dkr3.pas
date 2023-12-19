uses CRT;
var i,c,a,b,n : integer; x,y, integralsum : real;


function f(x: Real): Real;
begin
  Result := 2 * x * x * x - x * x + 2;
end;


function integral(g : real) : real;
begin
  Result := (g*g*g*g)/2 - (g*g*g)/3 + 2*g
end;


function square : real;
begin
  Result := integral(b) - integral(a);
end;


function sr_pryam(a, b: Real; n: Integer): Real;
var
  h, x, sum: Real;
  i: Integer;
begin
  h := (b - a) / n;
  x := a + h / 2;
  for i := 1 to n do
  begin
    sum := sum + f(x);
    x := x + h;
  end;
  Result := h * sum;
end;


procedure pogreshnost;
begin
  Writeln('Погрешность равна ',abs(square - sr_pryam(a,b,n)));
  readln();
end;


procedure new_predel;
begin
  ClrScr;
  writeln('Введите новые пределы и количество прямоугольников: ');
  readln(a,b,n);
end;


begin
  repeat
  ClrScr;
  writeln('Найти погрешность - 1');
  writeln('Найти площадь с помощью средних прямоугольников - 2');
  writeln('Найти площадь - 3');
  writeln('Ввести пределы и количество прямоугольников- 4');
  writeln('Ввести 0 для выхода из программы');
  readln(c);
  case c of
    1 : pogreshnost;
    2 : begin print(sr_pryam(a,b,n)); var ch : char; repeat readln(ch) until ch = #13; end;
    3 : begin write('Площадь равна '); writeln(square); readln(); end;
    4 : new_predel;
  end;
  until c = 0;
end.