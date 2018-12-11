with ada.text_io, ada.numerics.discrete_random;
use ada.text_io;

procedure simulation is

	package Rand is new Ada.Numerics.Discrete_Random(Natural);
	
	Type Side is (Imperial, Rebel);
	
	--~ Base
	task type Base(Base_Side: Side) is
		entry Send_Out_Ships(Num : in Integer);
		entry Ship_Lost;
		entry Destroy;
	end Base;
	
	--~ Declaration of bases
	Yavin_IV: Base(Rebel);
	Death_Star: Base(Imperial);

	--~ Ship
	task Type Ship (ID: Natural; Ship_Side: Side) is
		entry Hit;
		entry Call_Back;
	end Ship;
	
	Type Ship_Access is Access Ship;
	
	Type Ship_Data is Record
		This: Ship_Access;
		Alive: Boolean:= True;
	end Record;
	
	Type Matrix is array(1..10, 1..10) of Ship_Data; 
	
	--~ Projectile
	task type Projectile(Attacker_Side: Side; X: Natural; Y: Natural);
	
	--~ Map
	protected Map is
		procedure Init;
		function Get_Ship_Side(X: Natural; Y: Natural) return Side;
		function Get_Ship_Status(X: Natural; Y: Natural) return Boolean;
		function Get_Ship_Access(X: Natural; Y: Natural) return Ship_Access;
		procedure Kill_Ship(X: Natural; Y: Natural);
		procedure End_Fight;
		procedure Put_Map;
	private
		Ships: Matrix;
	end Map;
	
	--~ Agent
	task type Agent(This_Ship: Ship_Access);
	
	--~ Safe_Random
	protected Safe_Random is
		procedure Coordinate (X: out Natural; Y: out Natural);
	private
		G: Rand.Generator;
	end Safe_Random;
	protected body Safe_Random is separate;
	
	--~ Printer
	protected Printer is
		procedure Put(S: String);
		procedure Put(M: Matrix);
	end Printer;
	

	--~ Declaration of Luke
	Luke_Skywalker: Ship_Access;
	
	task body Base is separate;
	task body Ship is separate;
	task body Projectile is separate;
	task body Agent is separate;
	protected body Map is separate;
	protected body printer is separate;	
	
	
begin
	
	Map.Init;
	Yavin_IV.Send_Out_Ships(50);
	Death_Star.Send_Out_Ships(50);
	
	delay 5.0;
	Luke_Skywalker:= new Ship(589, Rebel);
	Printer.Put("Luke comes out!");

	
end simulation;
