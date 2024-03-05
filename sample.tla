------------------------------- MODULE sample -------------------------------

EXTENDS Integers
VARIABLES pi, n

Init == pi = 0
                
R01 == /\ pi = 0
       /\ n>0
       /\ pi' = 1
       /\ n' = n
       
R10 == /\ pi = 1
       /\ pi' = 2
       /\ n' = n-1

R02 == /\ n<=0
       /\ pi = 0
       /\ pi' = 2
       /\ n'=n

Next == /\ R01
        /\ R10
        /\ R02



=============================================================================
\* Modification History
\* Last modified Mon Feb 05 22:16:20 IST 2024 by amithabh_a
\* Created Mon Feb 05 13:52:01 IST 2024 by amithabh_a
