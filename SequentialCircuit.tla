------------------------- MODULE SequentialCircuit -------------------------



(* Question 1 *)

EXTENDS Integers

VARIABLES x1, r1, x2, r2

y1 == x1 \/ (~r1)
y2 == x2 /\ r2

Init1 == /\ r1 = TRUE
        /\ x1 \in {TRUE, FALSE}
        

Next1 == /\ r1' = (x1 /\ r1)
         /\ x1' \in {TRUE, FALSE}



(* Question 2 *)

Init2 == /\ r2 = FALSE
        /\ x2 \in {TRUE, FALSE}

Next2 == /\ r2' = (x2 \/ r2)
         /\ x2' \in {TRUE, FALSE}
        
Init == Init1 /\ Init2
Next == Next1 /\ Next2

=============================================================================
\* Modification History
\* Last modified Tue Feb 13 19:10:14 IST 2024 by amithabh_a
\* Created Tue Feb 13 17:51:05 IST 2024 by amithabh_a
