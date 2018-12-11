separate(simulation)

task body Projectile is
	Target: Ship_Access;
begin
	If Map.Get_Ship_Side(X, Y) /= Attacker_Side and Map.Get_Ship_Status(X, Y) then
		Target:= Map.Get_Ship_Access(X, Y);
		Target.Hit;
		Map.Kill_Ship(X, Y);
	end if;
end Projectile;
