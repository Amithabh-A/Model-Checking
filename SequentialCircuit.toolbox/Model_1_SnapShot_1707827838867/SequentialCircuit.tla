------------------------- MODULE SequentialCircuit -------------------------

(*

(* Question 1 *)
(* Circuit work for r1 = TRUE and FALSE *)

EXTENDS Integers

VARIABLES x1, y1, r1

Init == /\ r1 = TRUE
        /\ x1 = FALSE
        /\ y1 = FALSE
        

Next == /\ y1' = (x1 \/ (~r1))
        /\ r1' = (x1 /\ r1)
        /\ x1' = x1

*)

EXTENDS Integers

VARIABLES x2, r2, y2

Init == /\ r2 = TRUE
        /\ x2 = FALSE
        /\ y2 = FALSE

Next == /\ y2' = (x2 /\ r2)
        /\ r2' = (x2 \/ r2)

=============================================================================
\* Modification History
\* Last modified Tue Feb 13 18:07:11 IST 2024 by amithabh_a
\* Created Tue Feb 13 17:51:05 IST 2024 by amithabh_a
