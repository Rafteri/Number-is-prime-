program R2;

type
  coefficients = record
    k: real;
    b: real;
  end;
  fpoints = record
    r: real;
    phi: real;
  end;

procedure reading_coeff(var coeff: coefficients);
begin
  writeln('Enter the coefficient before x and free coefficient');
  readln(coeff.k);
  readln(coeff.b);
end;

function belong(points: fpoints; coeff: coefficients): boolean;
begin
  belong := (points.r * sin((180 / pi) * points.phi) = coeff.k * points.r * cos((180 / pi) * points.phi) + coeff.b);
end;

procedure output(belonging: boolean);
begin
  if belonging then
  begin
    writeln('They all lie on a given line');
  end
  else
  begin
    writeln('Not all lie on a given line');
  end;
end;

procedure belongs(coeff: coefficients);
var
  f1: text;
  points: fpoints;
  belonging: boolean;

begin
  belonging := true;
  assign(f1, 'Points.txt');
  reset(f1);
  while not eof(f1) and belonging do
  begin
    read(f1, points.r, points.phi);
    belonging := belong(points, coeff);
  end;
  output(belonging);
end;

var
  coeff: coefficients;

begin
  reading_coeff(coeff);
  belongs(coeff);
end.