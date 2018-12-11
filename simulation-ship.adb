separate(simulation)


task body Ship is
	Alive: Boolean:= True;
begin
	while Alive loop
		select
			accept Hit;
				Alive:= False;
				Printer.Put("A ship is hit!");
				if(Ship_Side = Rebel) then
					select
						Yavin_IV.Ship_Lost;
					or
						delay 1.0;
					end select;
				else
					select
						Death_Star.Ship_Lost;
					or
						delay 1.0;
					end select;
				end if;
		or
			accept Call_Back;
				Alive:= False;
		or delay 0.5;
			if ID = 589 then
				Printer.Put("Luke shoots!");
				declare
					X: Natural;
					Y: Natural;
				begin
					Safe_Random.Coordinate(X, Y);
					if X = Y then
						Printer.Put("It's a hit!");
						Death_Star.Destroy;
					else
						Printer.Put("Luke misses :(");
					end if;
				end;
			else
				declare
					P: Access Projectile;
					X: Natural;
					Y: Natural;
				begin
					Safe_Random.Coordinate(X, Y);
					P:= new Projectile(Ship_Side, X, Y);
				end;
			end if;
		end select;
	end loop;
end Ship;
