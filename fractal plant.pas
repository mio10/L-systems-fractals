uses
     GraphABC;

const
     STEP = 3.0;
     RAD = pi / 180;
     
type
     data = record
          x := 0;
          y := 200;
          angle := 45;
          constructor Create(x: integer; y: integer; angle: integer);
          begin
               Self.x := x;
               Self.y := y;
               Self.angle := angle;
          end;
     end;

var
     stack: System.Collections.Generic.Stack<data> := new System.Collections.Generic.Stack<data>();
     str: string := 'X';
     angle := 45;
     x := 0;
     y := 0;
     

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
               if (pos <= length(str)) and (str[pos] = 'X') then
               begin
                    delete(str, pos, 1);
                    insert('F-[[X]+X]+F[+FX]-X', str, pos);
                    pos += 18;
                    flag := true;
               end;
               
               if (pos <= length(str)) and (str[pos] = 'F') then
               begin
                    delete(str, pos, 1);
                    insert('FF', str, pos);
                    pos += 2;
                    flag := true;
               end;
               if flag = false then
                    pos += 1;
          end;
     end;
     
     for var i := 1 to length(str) do
     begin
          
          if (str[i] = 'F') then
               go();
          if str[i] = '-' then
               angle -= 25;
          if str[i] = '+' then
               angle += 25;
          if str[i] = '[' then
          begin
               stack.Push(new data(x, y, angle));
          end;
          if str[i] = ']' then
          begin
               var res: data := stack.Pop();
               x := res.x;
               y := res.y;
               angle := res.angle;
          end;
     end;

end.