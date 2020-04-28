//////////////////////////////////////////////////////////////////////////////////////////
// LibFile: GenNACAXXXX.scad                                                            //
//                                                                                      //
//   Generat a NACA 4 digits airfoil                                                    //
//                                                                                      //
//   by Alberto Solorzano Kraemer, 2020, betobetok@gmail.com                            //
//   https://www.thingiverse.com/thing:4314863                                          //    
//   https://github.com/betobetok/OpenScadNACAXXXX/edit/master/GenNACAXXXX.scad         //
//                                                                                      //
//   This file is public domain.  Use it for any purpose, including commercial          //
//   applications.  Attribution would be nice, but is not required.  There is           //
//   no warranty of any kind, including its correctness, usefulness, or safety.         //
//                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//                                                                //
//                                                                //
//                    ////    //////   //   //                    //
//                   // //   //        //  //                     //
//                  //  //   //        // //                      //
//                 ///////    //////   ////                       //
//                //    //        //   // //                      //
//               //     //   //////    //  //                     //
//                            __!__                               //
//                      ^----o-(_)-o----^                         //
//                                                                //
////////////////////////////////////////////////////////////////////
/*
	Author: Alberto Solorzano Kraemer ( betobetok@gmail.com )
	License: GPL
    
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

NOTE: The STL files are just examples, you can make your ouns.

If you found this useful, please donate what you think it is worth to my PayPal.me. Help cover the time of design.
Thanks, Enjoy!
*/

//EJEMPLOS:
//GenNACA(name="NACA3314", cuerda=60, extrucion=50);
//echo(NACA(name="NACA3314"));

module GenNACA(name="NACA0012", cuerda=10, extrucion=0.1){
   linear_extrude(height = extrucion, center = true, convexity = 20) polygon(points=cuerda*NACA(name));
}


function NACA(name="NACA0012") = concat(thicknessb((((ord(name[6])-48)*10)+ord(name[7])-48)/100, (ord(name[5])-48)/10, (ord(name[4])-48)/100),thicknessa((((ord(name[6])-48)*10)+ord(name[7])-48)/100, (ord(name[5])-48)/10, (ord(name[4])-48)/100));

function thicknessa(t, p, m, x=100, esp=[])= x==0 ? esp : thicknessa(t, p, m, x-1, concat(esp,[[(x/100)-sin(theta(x/100, p, m))*yt(t,x/100),chamber(x/100, p, m)+cos(theta(x/100, p, m))*yt(t, x/100)]]));

function thicknessb(t, p, m, x=1, esp=[[0,0]])= x==100 ? esp : thicknessb(t, p, m, x+1, concat(esp,[[(x/100)+sin(theta(x/100, p, m))*yt(t,x/100),chamber(x/100, p, m)-cos(theta(x/100, p, m))*yt(t, x/100)]]));

function chamber(x, p, m) = x<=p ? (m/(pow(p,2)))*(2*p*(x)-pow(x,2)) : (m/(pow((1-p),2)))*((1-2*p)+2*p*x-pow(x,2));

function theta(x, p, m) = x<=p ? atan((2*m/(pow(p,2)))*(p-x)) : atan((2*m/(pow((1-p),2)))*(p-x));

function yt(t,x) = 5*t*((0.2969*pow(x,0.5))-(0.1260*x)-(0.3516*pow(x,2))+(0.2843*pow(x,3))-(0.1015*pow(x,4)));
