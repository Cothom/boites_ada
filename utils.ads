with Ada.Command_Line, Ada.Text_Io;
use Ada.Command_Line, Ada.Text_Io;

package Utils is

    function Exist(File_Name : String) return Boolean;
    
    function Max(A, B : Float) return Float;

    procedure Read_Args(T, L, W, H, Q, B : out Float; File_Arg_Index : out Natural);
 
end Utils;
