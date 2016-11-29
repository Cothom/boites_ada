with Ada.Text_Io, Cotes;
use Ada.Text_Io, Cotes;

package Demi_Boite is

    procedure CalculNP(Max, T, Q : in Float; P : out Float; N : out Natural);

    procedure Tracer_Facette(Svg_File : File_Type; T, Xmax, Ymax, Q : Float; Face : String);

    procedure Tracer_Demi_Boite(Svg_File : File_Type; T, L, W, H, Q : Float);

end Demi_Boite;
