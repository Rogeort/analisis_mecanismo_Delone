model MultiLoopPositionsWithVel
  extends MultiLoopPositions;

  Real omega1, omega2, omega3, omega5, omega6;

equation
  omega1 = der(theta1);
  omega2 = der(theta2);
  omega3 = der(theta3);
  omega5 = der(theta5);
  omega6 = der(theta6);

annotation(
  experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-8, Interval = 0.01),
  __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS"));
end MultiLoopPositionsWithVel;
