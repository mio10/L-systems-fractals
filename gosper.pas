uses
     GraphABC;

const
     STEP = 6.0;
     RAD = pi / 180;
var
     str: string := 'A';
     angle := 45;
     x := 220;
     y := 150;


procedure go();
begin
     var dx := trunc(STEP*cos(angle*RAD) - STEP*sin(angle*RAD));
     var dy := trunc(STEP*sin(angle*RAD) + STEP*cos(angle*RAD));
     Line(x, y, x + dx, y + dy);
     x += dx;
     y += dy;
     
end;

begin
     
     var n := 1;
     readln(n);
     Coordinate.OriginX := trunc(Window.Height / 2);
     Coordinate.OriginY := trunc(Window.Width / 2);
     Coordinate.SetMathematic();
     
     for var i := 1 to n do
     begin
          var pos := 1;
          while pos <= length(str) do
          begin
               var flag := false;
               if (pos <= length(str)) and (str[pos] = 'A') then
               begin
                    delete(str, pos, 1);
                    insert('A-B--B+A++AA+B-', str, pos);
                    pos += 15;
                    flag := true;
               end;
               
               if (pos <= length(str)) and (str[pos] = 'B') then
               begin
                    delete(str, pos, 1);
                    insert('+A-BB--B-A++A+B', str, pos);
                    pos += 15;
                    flag := true;
               end;
               if flag = false then
                    pos += 1;
          end;
     end;
     for var i := 1 to length(str) do
     begin
          if (str[i] = 'A') or (str[i] = 'B') then
               go();
          if str[i] = '-' then
               angle += 60;
          if str[i] = '+' then
               angle -= 60;
     end;

end.