with Ada.Text_Io, Cotes;
use Ada.Text_Io, Cotes;

package body Demi_Boite is

    procedure CalculNP(max, T, Q : in Float; P : out Float; N : out Natural) is
    ---- Fonction calculant le nombre de queues + encoches n et l'espace jusqu'à la premiere encoche/queue ----
    -- Requiert : (Max - 2*T)/Q >= 1
    -- Garantit : N est impair, P >= T

    begin
        if Natural(Float'Floor((Max - 2*T)/Q)) mod 2 = 1 then
            N := Natural(Float'Floor((Max - 2*T)/Q));
        else
            N := Natural(Float'Floor((Max - 2*T)/Q)) - 1;
        end if;
            P := Float( T + (Max - 2.0*T - N*Q)/2.0 );
    end CalculNP;
    
    procedure Tracer_Facette(Svg_File : File_Type; T, Xmax, Ymax, Q : Float; Face : String) is
    ---- Fonction traçant une Tracer_Facette d'une demi-boite en utilisant les fonctions de Cotes ----
        
        Nx, Ny : Natural;
        Px, Py : Float;
    begin
        CalculNP(Xmax, T, Q, Px, Nx);
        CalculNP(Ymax, T, Q, Py, Ny);
        
        if Face = "centre" then
            CoteHautCentre(Svg_File, T, Xmax, Ymax, Px, Q, Nx);
            CoteDroitCentre(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
            CoteBasCentre(Svg_File, T, Xmax, Ymax, Px, Q, Nx);
            CoteGaucheCentre(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
        
        elsif Face = "avarr" then
            CoteHautAvarr(Svg_File, T, Xmax, Ymax, Px, Q, Nx);
            CoteDroitAvArr(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
            CoteGaucheAvArr(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
        
        elsif Face = "laterale" then
            CoteHautLateral(Svg_File, T, Xmax, Ymax, Px, Q, Nx);
            CoteDroitLateral(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
            CoteGaucheLateral(Svg_File, T, Xmax, Ymax, Py, Q, Ny);
        end if;

    end Tracer_Facette;
    
    
    procedure Tracer_Demi_Boite(Svg_File : File_Type; T, L, W, H, Q : Float) is
    ---- Fonction traçant une demi-boite entière à l'aide de la fonction Tracer_Facette ----
        
    begin
    
        Tracer_Facette(Svg_File, T, L, W, Q, "centre");
        Tracer_Facette(Svg_File, T, L, H/2.0, Q, "avarr");
        Tracer_Facette(Svg_File, T, L, H/2.0, Q, "avarr");
        Tracer_Facette(Svg_File, T, W, H/2.0, Q, "laterale");
        Tracer_Facette(Svg_File, T, W, H/2.0, Q, "laterale");
    
    end Tracer_Demi_Boite;
    
end Demi_Boite;
