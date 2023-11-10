# 2023-NERTHUS-Modelica
This model is an OpenModelica remake of 2022-NERTHUS-system-dynamics, which was made in MATLAB-Simulink.
For more information on the methodology and design, refer to the published journal paper on the original model. (https://www.sciencedirect.com/science/article/pii/S002954932300239X) 

Directory:
 - NERTHUS_Modelica.mo
 - NERTHUS_Simbase.mo

Explanation:
 - NERTHUS_Modelica.mo contains all of the packages for the equations, units, and connectors
 - NERTHUS_Simbase.mo is the model file. It connects all of the packages and has all of variables relevant to designing transients.

How to run:
 - Install OMEdit or any other Modelica Connection Editor
 - Open both files into your library workspace
 - Run the NERTHUS_Simbase.mo file
