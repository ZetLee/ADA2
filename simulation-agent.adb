separate(simulation)

task body agent is
begin
	select
		This_Ship.Call_Back;
	or
		delay 1.0;
	end select;
end agent;
