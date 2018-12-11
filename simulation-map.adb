separate(simulation)

protected body Map is
	
	
	procedure Init is
		ID : Natural:= 1;
	begin
		for I in 1..10 loop
			for J in 1..10 loop
				if I < 6 then
					Ships(I, J).This:= new Ship(ID, Imperial);
				else
					Ships(I, J).This:= new Ship(ID, Rebel);
				end if;
				ID:= ID+1;
			end loop;
		end loop;
	end Init;

	
	function Get_Ship_Side(X: Natural; Y: Natural) return Side is
	begin
		return Ships(X, Y).This.Ship_Side;
	end Get_Ship_Side;
	
	function Get_Ship_Status(X: Natural; Y: Natural) return Boolean is
	begin
		return Ships(X, Y).Alive;
	end Get_Ship_Status;
	
	function Get_Ship_Access(X: Natural; Y: Natural) return Ship_Access is
	begin
		return Ships(X, Y).This;
	end Get_Ship_Access;
	
	procedure Kill_Ship(X: Natural; Y: Natural) is
	begin
		Ships(X, Y).Alive:= False;
	end Kill_Ship;
	
	
	
	procedure End_Fight is
		Agens : access Agent;
	begin
		Agens := new Agent(Luke_Skywalker);
		Printer.Put("The End");
		for I in 1..10 loop
			for J in 1..10 loop
					Agens := new Agent(Ships(I, J).This);				
			end loop;
		end loop;
	end End_Fight;
	
	
	procedure Put_Map is
	begin
		Printer.Put(Ships);
	end Put_Map;
	
	
	
end Map;
