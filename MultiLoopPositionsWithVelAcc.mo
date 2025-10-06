model MultiLoopPositionsWithVelAcc
  extends MultiLoopPositionsWithVel;

  // Aceleraciones angulares
  Real alpha1, alpha2, alpha3, alpha5, alpha6;

equation
  // Aceleraciones = derivada temporal de las velocidades
  alpha1 = der(omega1);
  alpha2 = der(omega2);
  alpha3 = der(omega3);
  alpha5 = der(omega5);
  alpha6 = der(omega6);

annotation(
  experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-8, Interval = 0.01),
  __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS"));
end MultiLoopPositionsWithVelAcc;
