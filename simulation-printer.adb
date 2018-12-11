with ada.text_io;
use ada.text_io;

separate(simulation)

protected body Printer is
	procedure Put(S: String) is
	begin
		Put_Line(S);
	end Put;

	procedure Put(M: Matrix) is
	begin
		for X in 1..10 loop
			for Y in 1..10 loop
				if not M(X, Y).Alive then
					ada.text_io.Put("[ ]");
				else
					if M(X, Y).This.Ship_Side = Rebel then
						ada.text_io.Put("[R]");
					else
						ada.text_io.Put("[I]");
					end if;
				end if;
			end loop;
			New_Line;
		end loop;
	end Put;
end Printer;
