with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

package body Svg is
    
    procedure Svg_Header(Svg_File : File_Type; xmax, ymax : Float) is
    begin
        Put(Svg_File, "<svg width=""");
        Put(Svg_File,xmax+50.0,4,2,0);
        Put(Svg_File, """ height=""");
        Put(Svg_File,ymax+50.0,4,2,0); Put(Svg_File, """>");
        new_line(Svg_File);
        new_line(Svg_File);

    end Svg_Header;
    
    procedure Svg_BeginPolygone(Svg_File : File_Type) is
    begin
        Put(Svg_File, "<polygon points=""");
    end Svg_BeginPolygone;

    procedure Svg_EndPolygone(Svg_File : File_Type) is
    begin
        Put(Svg_File, """ style=""fill:none; stroke:red; stroke-width:0.1; ""/>");
        new_line(Svg_File);
    end Svg_EndPolygone;
    
    procedure Svg_Footer(Svg_File : File_Type) is
    begin
        new_line(Svg_File);
        Put_Line(Svg_File, "</svg>");
    end Svg_Footer;

end Svg;

