------------------------- MODULE SequentialCircuit -------------------------


EXTENDS Integers

VARIABLES x1, y1, r1

Init == /\ r1 = 0
        /\ x1 = 0
        /\ y1 = 1
        

Next == /\ y1' = (x1 \/ (~r1))
        /\ r1' = (x1 /\ r1)
        /\ x1' = x1

=============================================================================
\* Modification History
\* Last modified Tue Feb 13 17:57:13 IST 2024 by amithabh_a
\* Created Tue Feb 13 17:51:05 IST 2024 by amithabh_a
