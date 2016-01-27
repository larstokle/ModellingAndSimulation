model Tank
	import SI = Modelica.SIunits;
	// Constants
	constant Real g = Modelica.Constants.g_n;

	// Parameters
	parameter SI.Area A = 1.0 "Area of tank";
	parameter SI.Density rho = 0.2 "Fluid density";

	// Ports
	FlowPort flowPort "fluid flows in or out of tank";

	// Variables
	SI.Pressure p "Pressure in tank";
	SI.Length h "Liquid level in tank";

	equation
	// Relation pressure and height
	p = rho∗g∗h;

	// Mass balances for each tank
	A∗der(h) = −flowPort.q;

	// Set pressure in port
	flowPort.p = p;
end Tank;