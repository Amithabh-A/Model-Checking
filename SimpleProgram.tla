\*--------------------------- MODULE SimpleProgram ---------------------------
\*EXTENDS Integers
\*VARIABLES i, pc   
\*
\*Init == (pc = "start") /\ (i = 0)
\*
\*Pick == /\ pc = "start"  
\*        /\ i' \in 0..1000
\*        /\ pc' = "middle"
\*
\*Add1 == /\ pc = "middle" 
\*        /\ i' = i + 1
\*        /\ pc' = "done"  
\*           
\*Next == Pick \/ Add1

EXTENDS Integer
VARIABLES pi, n

Init == pi = 0

Next == /\ r01
        /\ r10
        /\ r02
        
        
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

=============================================================================
\* Modification History
\* Last modified Mon Feb 05 19:49:07 IST 2024 by amithabh_a
\* Created Wed Jan 31 08:38:52 IST 2024 by amithabh_a
