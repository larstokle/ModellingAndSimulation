model RL_circuit
  import SI = Modelica.SIunits;

  parameter SI.Resistance R = 2;
  parameter SI.Inductance L = 1;
  parameter SI.Current i_r = 3 "reference current";
  parameter Real Kp = 2;

  SI.Voltage u "input voltage";
  SI.Current i( start = 1) "output current";
equation 
  //foroverkobling + pådrag
  u = R*i_r + Kp*(i_r - i);
  //difflikn for i
  L*der(i) = -R*i + u;
  annotation (uses(Modelica(version="3.2.1")),
    experiment(__Dymola_fixedstepsize=0.01, __Dymola_Algorithm="Rkfix4"),
    __Dymola_experimentSetupOutput);
end RL_circuit;
