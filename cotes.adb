with Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io, Svg;
use Ada.Command_Line, Ada.Text_Io, Ada.Float_Text_Io, Svg;

package body Cotes is

    Total_Marge_X : Float := 0.0 ;
    Marge : Float := 5.0;

    function "*" (Left : Natural; Right : Float) return Float is
    begin
        return Float(Left)*Right;
    end "*";

    procedure PutPoint(Svg_File : File_Type; X, Y : Float) is
    begin
        Put(Svg_File, X + Total_Marge_X ,4,2,0); Put(Svg_File, ","); Put(Svg_File, Y ,4,2,0); Put(Svg_File, " ");
    end PutPoint;

    procedure CoteHautCentre(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural) is
    begin
        Svg_BeginPolygone(Svg_File);
        PutPoint(Svg_File, 0.0, 0.0);
        
        for K in 0 .. Nx loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Px + K*Q, T);
                PutPoint(Svg_File, Px + K*Q, 0.0);
            else
                PutPoint(Svg_File, Px + K*Q, 0.0);
                PutPoint(Svg_File, Px + K*Q, T);
            end if;
        end loop;
        
        PutPoint(Svg_File, Xmax, 0.0);
    end CoteHautCentre;

    procedure CoteBasCentre(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural) is
    begin
        for K in 0 .. Nx loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Xmax - (Px + K*Q), Ymax - T);
                PutPoint(Svg_File, Xmax - (Px + K*Q), Ymax);
            else
                PutPoint(Svg_File, Xmax - (Px + K*Q), Ymax);
                PutPoint(Svg_File, Xmax - (Px + K*Q), Ymax - T);
            end if;
        end loop;
        PutPoint(Svg_File, 0.0, Ymax);
    end CoteBasCentre;

    procedure CoteDroitCentre(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
                PutPoint(Svg_File, Xmax, Py + K*Q);
            else
                PutPoint(Svg_File, Xmax, Py + K*Q);
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
            end if;
        end loop;
        PutPoint(Svg_File, Xmax, Ymax);
    end CoteDroitCentre;

    procedure CoteGaucheCentre(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, T , Ymax - (Py + K*Q));
                PutPoint(Svg_File, 0.0 , Ymax - (Py + K*Q));
            else
                PutPoint(Svg_File, 0.0 , Ymax - (Py + K*Q));
                PutPoint(Svg_File, T , Ymax - (Py + K*Q));
            end if;
        end loop;

        Total_Marge_X := Total_Marge_X + Xmax + Marge;
        
        Svg_EndPolygone(Svg_File);
    end CoteGaucheCentre;

    procedure CoteHautAvarr(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural) is
    begin
        Svg_BeginPolygone(Svg_File);
        PutPoint(Svg_File, 0.0, T);
        for K in 0 .. Nx loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Px + K*Q, 0.0);
                PutPoint(Svg_File, Px + K*Q, T);
            else
                PutPoint(Svg_File, Px + K*Q, T);
                PutPoint(Svg_File, Px + K*Q, 0.0);
            end if;
        end loop;
        --Put(Svg_File, Xmax,4,2,0); Put(Svg_File, ",0.0 "); Put(Svg_File, " ");

    end CoteHautAvarr;

    procedure CoteDroitAvarr(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        PutPoint(Svg_File, Xmax , T);
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
                PutPoint(Svg_File, Xmax, Py + K*Q);
            else
                PutPoint(Svg_File, Xmax, Py + K*Q);
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
            end if;
        end loop;
        PutPoint(Svg_File, Xmax, Ymax);

    end CoteDroitAvarr;

    procedure CoteGaucheAvarr(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        PutPoint(Svg_File, 0.0, Ymax);
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, T, Ymax - (Py + K*Q));
                PutPoint(Svg_File, 0.0, Ymax - (Py + K*Q));
            else
                PutPoint(Svg_File, 0.0, Ymax - (Py + K*Q));
                PutPoint(Svg_File, T, Ymax - (Py + K*Q));
            end if;
        end loop;

        Total_Marge_X := Total_Marge_X + Xmax + Marge;

        Svg_EndPolygone(Svg_File);
    end CoteGaucheAvarr;

    procedure CoteHautLateral(Svg_File : File_Type; T, Xmax, Ymax, Px, Q : Float; Nx : Natural) is
    begin
        Svg_BeginPolygone(Svg_File);
        PutPoint(Svg_File, T, T);
        
        for K in 0 .. Nx loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Px + K*Q, 0.0);
                PutPoint(Svg_File, Px + K*Q, T);
            else
                PutPoint(Svg_File, Px + K*Q, T);
                PutPoint(Svg_File, Px + K*Q, 0.0);
            end if;
        end loop;
        PutPoint(Svg_File, Xmax - T, T);
    end CoteHautLateral;

    procedure CoteDroitLateral(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, Xmax, Py + K*Q);
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
            else
                PutPoint(Svg_File, Xmax - T, Py + K*Q);
                PutPoint(Svg_File, Xmax, Py + K*Q);
            end if;
        end loop;
        PutPoint(Svg_File, Xmax - T, Ymax);

    end CoteDroitLateral;

    procedure CoteGaucheLateral(Svg_File : File_Type; T, Xmax, Ymax, Py, Q : Float; Ny : Natural) is
    begin
        PutPoint(Svg_File, T, Ymax);
        for K in 0 .. Ny loop
            if K mod 2 = 1 Then
                PutPoint(Svg_File, 0.0, Ymax - (Py + K*Q));
                PutPoint(Svg_File, T, Ymax - (Py + K*Q));
            else
                PutPoint(Svg_File, T, Ymax - (Py + K*Q));
                PutPoint(Svg_File, 0.0, Ymax - (Py + K*Q));
            end if;
        end loop;

        Total_Marge_X := Total_Marge_X + Xmax + Marge;
        
        Svg_EndPolygone(Svg_File);
    end CoteGaucheLateral;

end Cotes;
