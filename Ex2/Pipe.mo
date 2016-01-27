model Pipe
	import SI = Modelica.SIunits;

	//constants
	constant Real g = Modelica.Constants.pi

	//parameters
	parameter SI.Length L = 0.1 "Pipe length";
	parameter SI.Length D = 0.2 "Pipe diameter";
	parameter SI.DynamicViscosity mu = 2e−3 "Fluid dynamic viscosity";

	//ports
	FlowPort fp1 "flow into pipe";
	FlowPort fp2 "flow out of pipe";

	//variables
	SI.VolumeFlowRate q "flow through pipe";

equation
	//pipeflow
	q = (fp1.p-fp2.p)*(pi*D^4/(128*mu*L));

	//set flow in port
	fp1.q = -q;
	fp2.q = q;
end Pipe


