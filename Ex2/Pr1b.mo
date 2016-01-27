model TwoTanks_SI
	import SI = Modelica.SIunits;

	// Constants
	constant Real pi = 3.14;
	constant Real g = 9.81;

	// Parameters
	parameter SI.Area A1 = 1.0 "Area of tank 1";
	parameter SI.Area A2 = 2.0 "Area of tank 2";
	parameter SI.Length L = 0.1 "Pipe length";
	parameter SI.Length D = 0.2 "Pipe diameter";
	parameter SI.Density rho = 0.2 "Fluid density";
	parameter SI.DynamicViscosity mu = 2e−3 "Fluid dynamic viscosity";

	// Variables
	SI.Preassure p1 "Pressure in tank 1";
	SI.Preassure p2 "Pressure in tank 2";
	SI.Length h1 "Liquid level in tank 1";
	SI.Length h2 "Liquid level in tank 2";
	SI.VolumeFlowRate q "Volume flow rate between tanks";

equation
	// Relation pressure and height
	p1 = rho*g*h1;
	p2 = rho*g*h2;

	// Flow between tanks (positive out of tank 1)
	q = (p1-p2)*(pi*D^4/(128*mu*L));
	// Mass balances for each tank
	A1*der(h1) = -q;
	A2*der(h2) = q;

end TwoTanks_SI;