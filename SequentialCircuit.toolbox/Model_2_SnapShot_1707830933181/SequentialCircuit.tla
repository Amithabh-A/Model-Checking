------------------------- MODULE SequentialCircuit -------------------------



(* Question 1 *)

EXTENDS Integers

VARIABLES x1, y1, r1, x2, y2, r2

Init1 == /\ r1 = TRUE
        /\ x1 = FALSE
        /\ y1 = FALSE
        

Next1 == /\ y1' = (x1 \/ (~r1))
        /\ r1' = (x1 /\ r1)
        /\ x1' = x1



(* Question 2 *)

Init2 == /\ r2 = FALSE
        /\ x2 = FALSE
        /\ y2 = FALSE

Next2 == /\ y2' = (x2 /\ r2)
        /\ r2' = (x2 \/ r2)
        /\ x2' = x2
        
Init == Init1 /\ Init2
Next == Next1 /\ Next2

=============================================================================
\* Modification History
\* Last modified Tue Feb 13 18:58:46 IST 2024 by amithabh_a
\* Created Tue Feb 13 17:51:05 IST 2024 by amithabh_a
