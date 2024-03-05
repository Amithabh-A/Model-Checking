------------------------------- MODULE Light -------------------------------

EXTENDS Integers

variables light1, light2, Counter

TypeOK == /\ Counter 0..20

Init == /\ light1 = "Red"
        /\ light2 = "Green"
        /\ Counter = 20
        


\*EXTENDS Integers
\*
\*VARIABLES small, big   
\*          
\*TypeOK == /\ small \in 0..5 
\*          /\ big   \in 0..7
\*
\*Init == /\ big   = 0
\*        /\ small = 0
\*
\*FillSmall == /\ small' = 5 
\*             /\ big'   = big
\*
\*FillBig == /\ big'   = 7 
\*           /\ small' = small
\*
\*EmptySmall == /\ small' = 0 
\*              /\ big'   = big 
\*
\*EmptyBig == /\ big'   = 0 
\*            /\ small' = small
\*
\*SmallToBig == IF big + small =< 7
\*               THEN /\ big'   = big + small
\*                    /\ small' = 0
\*               ELSE /\ big'   = 7
\*                    /\ small' = small + big - 7
\*
\*BigToSmall == IF big + small =< 5
\*               THEN /\ big'   = 0 
\*                    /\ small' = big + small
\*               ELSE /\ big'   = small + big - 5
\*                    /\ small' = 5
\*
\*Next == \/ FillSmall 
\*        \/ FillBig    
\*        \/ EmptySmall 
\*        \/ EmptyBig    
\*        \/ SmallToBig    
\*        \/ BigToSmall   

=============================================================================
\* Modification History
\* Last modified Tue Feb 06 18:35:06 IST 2024 by amithabh_a
\* Created Tue Feb 06 18:29:23 IST 2024 by amithabh_a
