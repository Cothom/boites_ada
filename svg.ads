with Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io;
use Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io;

package Svg is

    procedure Svg_Header(Svg_File : File_Type; xmax, ymax : Float);

    procedure Svg_BeginPolygone(Svg_File : File_Type);

    procedure Svg_EndPolygone(Svg_File : File_Type);

    procedure Svg_Footer(Svg_File : File_Type);

end Svg;
