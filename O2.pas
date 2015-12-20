program O2;

const
  N = 10;

type
  arr_int = array [1..N] of integer;

var
  a: arr_int;

procedure read_arr(var a: arr_int);
var
  i: integer;
begin
  writeln('Enter elements of array:');
  for i := 1 to N do
  begin
    readln(a[i]);
  end;
end;

procedure write_arr(var a: arr_int);
var
  i: integer;
begin
  writeln('Sorted elements of array:');
  for i := 1 to N do
  begin
    writeln(a[i]);
  end;
end;

procedure search_max_sort(var a: arr_int);
var
  i, j, max, ind: integer;
begin
  for i := N downto 2 do
  begin
    max := a[i];
    for j := i - 1 downto 1 do
    begin
      if (max < a[j]) then
      begin
        max := a[j];
        ind := j;
      end;
    end;
    if (max > a[i]) then
    begin
      a[ind] := a[i] + a[ind];
      a[i] := a[ind] - a[i];
      a[ind] := a[ind] - a[i];
    end;
  end;
end;

begin
  read_arr(a);
  search_max_sort(a);
  write_arr(a);
end.