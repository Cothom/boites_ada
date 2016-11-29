with Ada.Command_Line, Ada.Text_Io, Utils, Demi_Boite, Svg, Cotes;
use Ada.Command_Line, Ada.Text_Io, Utils, Demi_Boite, Svg, Cotes;

procedure Boites is
    
    Thickness, Ext_Length, Int_Length, Ext_Width, Int_Width, Queue, Ext_Height, Int_Height, Svg_Width, Svg_Height, Marge : Float;
    File_Arg_Index : Natural;
    Svg_File : File_Type;
    Nb_Arg_Exc, Arg_Exc, Arg_Intern_Height_Exc, Arg_Queue_Width_Exc : Exception;
    
begin

    Read_Args(Thickness, Ext_Length, Ext_Width, Ext_Height, Queue, Int_Height, File_Arg_Index);
    
    Marge := 5.0;
    Int_Length := Ext_Length - (2.0 * Thickness);
    Int_Width := Ext_Width - (2.0 * Thickness);
    Int_Height := Ext_Height - (2.0 * Thickness);
    
    Svg_Width := (3.0 * Ext_Length + 2.0 * Ext_Width) * 2.0 + (3.0 * Int_Length + 2.0 * Int_Width) + 15.0 * Marge;
    Svg_Height := Max(Ext_Height, Ext_Height) + 2.0 * Marge;
    
    if Exist(Argument(File_Arg_Index)) then
        Open(Svg_File, Out_File, Argument(File_Arg_Index));
    else
        Create(Svg_File, Out_File, Argument(File_Arg_Index));
    end if;
    
    Svg_Header(Svg_File, Svg_Width, Svg_Height);
    
    Tracer_Demi_Boite(Svg_File, Thickness, Ext_Length, Ext_Width, Ext_Height, Queue); -- Première demi-boite externe
    Tracer_Demi_Boite(Svg_File, Thickness, Ext_Length, Ext_Width, Ext_Height, Queue); -- Deuxième demi-boite externe
    Tracer_Demi_Boite(Svg_File, Thickness, Int_Length, Int_Width, Int_Height, Queue); -- Demi-boite interne

    Svg_Footer(Svg_File);
    Close(Svg_File);

end Boites;
