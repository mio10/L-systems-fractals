uses
     GraphABC;

const
     STEP = 3;

var
     str: string := 'FX';
     dx := 0;
     dy := STEP;
     x := 230;
     y := 170;

procedure turn(dir: string);
begin
     if dir = 'right' then
     begin
          if (dx = 0) and (dy > 0) then // верх
          begin
               dy := 0;
               dx := STEP;
               exit;
          end;
          if (dx > 0) and (dy = 0) then // право
          begin
               dy := -STEP;
               dx := 0;
               exit;
          end;
          if (dx = 0) and (dy < 0) then // низ
          begin
               dy := 0;
               dx := -STEP;
               exit;
          end;
          if (dx < 0) and (dy = 0) then // лево
          begin
               dy := STEP;
               dx := 0;
               exit;
          end;
     end;
     if dir = 'left' then
     begin
          if (dx = 0) and (dy > 0) then // верх
          begin
               dy := 0;
               dx := -STEP;
               exit;
          end;
          if (dx > 0) and (dy = 0) then // право
          begin
               dy := STEP;
               dx := 0;
               exit;
          end;
          if (dx = 0) and (dy < 0) then // низ
          begin
               dy := 0;
               dx := STEP;
               exit;
          end;
          if (dx < 0) and (dy = 0) then // лево
          begin
               dy := -STEP;
               dx := 0;
               exit;
          end;
     end;
end;

procedure go();
begin
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
                    insert('X+YF+', str, pos);
                    pos += 5;
                    flag := true;
               end;
               
               if (pos <= length(str)) and (str[pos] = 'Y') then
               begin
                    delete(str, pos, 1);
                    insert('-FX-Y', str, pos);
                    pos += 5;
                    flag := true;
               end;
               if flag = false then
                    pos += 1;
          end;
     end;
     for var i := 1 to length(str) do
     begin
          if str[i] = 'F' then
               go();
          if str[i] = '-' then
               turn('left');
          if str[i] = '+' then
               turn('right');
     end;
end.