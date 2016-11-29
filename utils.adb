with Ada.Command_Line, Ada.Text_Io;
use Ada.Command_Line, Ada.Text_Io;

package body Utils is
    
    function Exist(File_Name : String) return Boolean is
    ---- Fonction testant l'existence d'un fichier ----
        File : File_Type;
    
    begin
        Open(File, In_File, File_Name);
        Close(File);
        return True;
    
    exception
        when Name_Error => return False;
        when others => raise;
    
    end Exist;

    function Max(A, B : Float) return Float is
    begin
        if A > B then
            return A;
        else
            return B;
        end if;
    end Max;

    procedure Read_Args(T, L, W, H, Q, B : out Float; File_Arg_Index : out Natural) is
    ---- Fonction lisant les arguments de la ligne de commande et vérifiant les erreurs possibles ----
        I : Natural; 
        Nb_Arg_Exc, Arg_Exc, Arg_Intern_Height_Exc, Arg_Queue_Width_Exc : Exception;

    begin
        T := 0.0;
        L := 0.0;
        W := 0.0;
        H := 0.0;
        Q := 0.0;
        B := 0.0;
        File_Arg_Index := 0;

        if Argument_Count /= 14 then
            raise Nb_Arg_Exc;
        end if;
        
        I := 1;
        while I <= Argument_Count loop    
        
            if Argument(I) = "-t" then
                T := Float'Value(Argument(I+1));
       
            elsif Argument(I) = "-l" then
                L := Float'Value(Argument(I+1));
            
            elsif Argument(I) = "-w" then
                W := Float'Value(Argument(I+1));
            
            elsif Argument(I) = "-h" then
                H := Float'Value(Argument(I+1));
            
            elsif Argument(I) = "-q" then
                Q := Float'Value(Argument(I+1));
            
            elsif Argument(I) = "-b" then
                B := Float'Value(Argument(I+1));
            
            elsif Argument(I) = "-f" then
                File_Arg_Index := I+1;
            end if;
            
            I := I + 2;
        end loop;
        
        
        if T * L * W * H * Q * B = 0.0 or File_Arg_Index = 0 then
            raise Arg_Exc;
        
        elsif B > (H - 2.0 * T) then
            raise Arg_Intern_Height_Exc;
        
        elsif (L - 2.0*T)/Q < 1.0 or (W - 2.0*T)/Q < 1.0 or (H/2.0 - 2.0*T)/Q < 1.0 or (B/2.0 - 2.0*T)/Q < 1.0 then
            raise Arg_Queue_Width_Exc;
        
        end if;
    

    exception
   
        when Nb_Arg_Exc => 
            Put_Line("ERREUR : Le nombre d'arguments spécifiés est incorrect.");
            raise Nb_Arg_Exc;

        when Arg_Exc =>
            Put_Line("ERREUR : Les paramètres n'ont pas été donnés correctement.");
            raise Arg_Exc;
        
        when Arg_Intern_Height_Exc =>
            Put_Line("ERREUR : La hauteur interne b est trop grande, elle doit etre inférieure à h - 2*t.");
            raise Arg_Intern_Height_Exc;
        
        when Arg_Queue_Width_Exc =>
            Put_Line("ERREUR : La largeur des queues et encoches est trop grande par rapport aux dimensions de la boite.");
            raise Arg_Queue_Width_Exc;
   
    end Read_Args;

end Utils;
