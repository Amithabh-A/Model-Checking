------------------------- MODULE SequentialCircuit -------------------------


EXTENDS Integers

VARIABLES x1, y1, r1

Init == /\ r1 = TRUE
        /\ x1 = FALSE
        /\ y1 = FALSE
        

Next == /\ y1' = (x1 \/ (~r1))
        /\ r1' = (x1 /\ r1)
        /\ x1' = x1

=============================================================================
\* Modification History
\* Last modified Tue Feb 13 18:02:54 IST 2024 by amithabh_a
\* Created Tue Feb 13 17:51:05 IST 2024 by amithabh_a
