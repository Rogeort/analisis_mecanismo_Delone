# Mecanismo de Delone

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![OpenModelica](https://img.shields.io/badge/OpenModelica-1.20%2B-orange)
![FMI](https://img.shields.io/badge/FMI-2.0-yellow)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)

Repositorio con la implementación y simulación de un mecanismo de Delone, incluyendo análisis analítico y simulaciones interactivas. 

El código para resolver los sistemas de manera analítica se encuentra en el archivo `main.ipynb`.  

Los modelos en OpenModelica incluyen:  
- `MultiLoopPositions.mo`: Modelo básico para el cálculo de posiciones del mecanismo.  
- `MultiLoopPositionsWithVel.mo`: Extiende el modelo anterior para calcular también las velocidades angulares.  
- `MultiLoopPositionsWithVelAcc.mo`: Modelo completo que simula posiciones, velocidades y aceleraciones.  

El archivo `PxvsPy.csv` contiene las coordenadas resultantes de la simulación, útiles para análisis o visualización externa.  
