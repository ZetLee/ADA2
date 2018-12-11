separate(simulation)

task body Base is
	Ships : Integer;
begin
	accept Send_Out_Ships(Num : in Integer) do
		Ships:= Num;
		Printer.Put(Side'Image(Base_Side) & " base sent out " & Integer'Image(Num) & " ships!");
		Map.Put_Map;
	end Send_Out_Ships;
	while Ships > 0 loop
		select
			accept Ship_Lost do
				Ships := Ships - 1;
				Printer.Put(Side'Image(Base_Side) & " base lost one ship!");
				Map.Put_Map;
			end Ship_Lost;
		or
			accept Destroy do
				Ships:= 0;
				Printer.Put(Side'Image(Base_Side) & " Base destroyed!");
			end Destroy;
		end select;
	end loop;
	Map.End_Fight;
end Base;
