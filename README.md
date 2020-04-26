# OpenScadNACAXXXX

NACA 4 digits airfoil generator

SUMARY

NACA 4 digits airfoil generator
  by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com

This file is public domain. Use it for any purpose, including commercial
applications. Attribution would be nice but is not required. There is
no warranty of any kind, including its correctness, usefulness, or safety.

You can use this file to simply generate a NACA 4 digits airfoil, you can generate an extruded airfoil (win section) or an array of points that you can use in Openscad or another software

USE

syntax:

Module  to generate an extruded airfoil   
GenNACA() : Generate an airfoil NACA0012 with Chord = 10 and Wingspan = 0.1
GenNACA(name="NACAXXXX") : Generate an airfoil NACAXXXX with Chord = 10 and Wingspan = 0.1
GenNACA(name="NACAXXXX",Cuerda=X) : Generate an airfoil NACAXXXX with Chord = X and Wingspan = 0.1
GenNACA(name="NACAXXXX",Cuerda=X,Extrucion=Y) : Generate an airfoil NACA0012 with Chord = X and Wingspan = Y

Function to generate an array with the airfoil points
NACA() : return the cordinates of airfoil NACA0012 in the array [[0,0][x,-y]....[1,-y][0.9,y]....[x,y][0,0]]
NACA(name="NACAXXXX") : return the cordinates of airfoil NACAXXXX in the array [[0,0][x,-y]....[1,-y][0.9,y]....[x,y][0,0]]

Enjoy
