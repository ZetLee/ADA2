separate(simulation)

protected body Safe_Random is
	procedure Coordinate (X: out Natural; Y: out Natural) is
	begin
		Rand.Reset(G);
		X := (Rand.Random(G) mod 10) + 1;
		Y := (Rand.Random(G) mod 10) + 1;
	end Coordinate;
end Safe_Random;
