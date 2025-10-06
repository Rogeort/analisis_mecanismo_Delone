model MultiLoopPositions
  // =====================
  // Parámetros geométricos
  // =====================
  parameter Real l1 = 10 "Longitud eslabón 1";
  parameter Real l2 = 20 "Longitud eslabón 2";
  parameter Real l3 = 20 "Longitud eslabón 3";
  parameter Real l4 = 20 "Longitud eslabón 4";
  parameter Real l5 = 20 "Longitud eslabón 5";
  parameter Real l6 = 20 "Longitud eslabón 6";
  parameter Real s  = 30 "Separación/anclaje entre lazos";

  // =====================
  // Entrada: theta1(t) = theta1_0 + w1 * time
  // =====================
  parameter Real theta1_0 = 0 "Ángulo inicial de entrada";
  parameter Real w1 = 0.125 "Velocidad angular de entrada (rad/s)";

  Real theta1 "Ángulo de entrada (conocido, función del tiempo)";

  // Ángulos incógnita (posiciones)
  Real theta2(start = Modelica.Constants.pi/3) "Ángulo eslabón 2 (incógnita)";
  Real theta3(start = -Modelica.Constants.pi/3) "Ángulo eslabón 3 (incógnita)";
  Real theta5(start = -Modelica.Constants.pi/3) "Ángulo eslabón 5 (incógnita)";
  Real theta6(start = Modelica.Constants.pi/3) "Ángulo eslabón 6 (incógnita)";

  // Coordenadas del punto P (salida del segundo lazo)
  Real xP "Coordenada X del extremo del lazo 2";
  Real yP "Coordenada Y del extremo del lazo 2";

equation
  // Entrada como función del tiempo (sin derivadas)
  theta1 = theta1_0 + w1*time;

  // =====================
  // Lazo 1: l1 e^{iθ1} + l2 e^{iθ2} + l3 e^{iθ3} = s  (componentes reales e imaginarios)
  // =====================
  l1*cos(theta1) + l2*cos(theta2) + l3*cos(theta3) = s;
  l1*sin(theta1) + l2*sin(theta2) + l3*sin(theta3) = 0;

  // =====================
  // Lazo 2: l3 e^{iθ3} + l4 e^{iθ2} = l6 e^{iθ6} + l5 e^{iθ5}
  // =====================
  l3*cos(theta3) + l4*cos(theta2) = l6*cos(theta6) + l5*cos(theta5);
  l3*sin(theta3) + l4*sin(theta2) = l6*sin(theta6) + l5*sin(theta5);

  // =====================
  // Salida: coordenadas del extremo del lazo 2 (solo posiciones)
  // =====================
  xP = l3*cos(theta3) + l4*cos(theta2);
  yP = l3*sin(theta3) + l4*sin(theta2);

initial equation
  // Forzar consistencia inicial (time = 0 -> theta1 = theta1_0)
  theta1 = theta1_0;
  l1*cos(theta1) + l2*cos(theta2) + l3*cos(theta3) = s;
  l1*sin(theta1) + l2*sin(theta2) + l3*sin(theta3) = 0;
  l3*cos(theta3) + l4*cos(theta2) = l6*cos(theta6) + l5*cos(theta5);
  l3*sin(theta3) + l4*sin(theta2) = l6*sin(theta6) + l5*sin(theta5);

annotation (
  experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-8, Interval = 0.01),
  __OpenModelica_simulationFlags(lv = "LOG_STATS"));
end MultiLoopPositions;
