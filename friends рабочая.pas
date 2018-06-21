program test;
var n: byte;
i,j,s,size,cur:integer;
good,check :boolean;
const x=15;
var
matrix: array [1..x, 1..x] of integer;
canGroup: array [1..x, 1..x] of boolean;
var input: text;
output:text;
bestcode, bestsize,  groupcode:integer;
begin
good:=true;
cur:=2;
size:=0;
bestcode:=-1;
bestsize:=0;
assign(input,'input.txt');
reset(input);
read(input,n);
check:=true;
S:=1;
for i:=1 to N do S:=S*2;
for i:=1 to n do
begin
for j:=1 to n do
read(input,matrix[i,j]);
end;


for i:=1 to n do
begin
for j:=1 to n do
begin
if(matrix[i,j]mod 2=0)then canGroup[i,j]:=false
else canGroup[i,j]:=true;
end;
end;
close(input);


for groupcode:=1 to (1 shl n) do
  begin 
  for i:=1 to n do
    if(((groupcode shr i)xor check)<>0) then size:=size+1;

  if (size>5) then  continue; 
  if (size<=bestsize) then  continue; 
  good :=true;
  for i:=1 to (n ) do
  if (good=false) then break else
    begin
    for j:=1 to (n ) do if (good=false) then break else
      begin
      if ((((groupcode shr i)xor check)<>0)and(((groupcode shr j)xor check)<>0)and (not (canGroup[i,j]))) then
      good:=false;
      end;
    end;
  if (good) then 
  begin
  bestcode:=groupCode;
  bestsize:=size;
  end;
  end;
  Writeln(n- bestsize+1);
  for i:=1 to n do
  if (((bestcode shr i) xor check)<>0) then writeln('1')
  else begin
  writeln(cur);
  cur:=cur+1;
  end

end.
