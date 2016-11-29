with Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io, Svg;
use Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io, Svg;

package Cotes is
    
    function "*"(Left : Natural; Right : Float) return Float;

    procedure PutPoint(Svg_File : File_Type; X, Y : Float);

    procedure CoteHautCentre(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural);
    procedure CoteBasCentre(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural);
    procedure CoteDroitCentre(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);
    procedure CoteGaucheCentre(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);

    procedure CoteHautAvarr(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural);
    procedure CoteDroitAvarr(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);
    procedure CoteGaucheAvarr(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);

    procedure CoteHautLateral(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural);
    procedure CoteDroitLateral(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);
    procedure CoteGaucheLateral(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural);

end;
