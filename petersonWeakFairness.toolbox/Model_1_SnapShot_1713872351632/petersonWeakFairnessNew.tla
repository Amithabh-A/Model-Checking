------------------------------ MODULE petersonWeakFairnessNew ------------------------------
EXTENDS Integers

VARIABLES pc0, pc1, turn, intr0, intr1


Init == /\ pc0 = 0
        /\ pc1 = 0
        /\ turn = 0
        /\ intr0 = 0
        /\ intr1 = 0
       

l01 == /\ pc0 = 0
       /\ pc0' = 1
       /\ turn' = turn
       /\ intr0' = intr0
       /\ intr1' = intr1


      
l12 == /\ pc0 = 1
       /\ pc0' = 2
       /\ turn' = turn
       /\ intr0' = intr0
       /\ intr1' = intr1
       

      
l23 == /\ pc0 = 2
       /\ pc0' = 3
       /\ turn' = turn
       /\ intr0' = 1
       /\ intr1' = intr1
       


l34 == /\ pc0 = 3
       /\ pc0' = 4
       /\ turn' = 0
       /\ intr0' = intr0
       /\ intr1' = intr1
       

l44 == /\ pc0 = 4
       /\ pc0' = 4
       
       /\ turn = 1
       /\ intr1 = 1
       
       /\ turn' = turn
       /\ intr0' = intr0
       /\ intr1' = intr1


l45 == /\ pc0 = 4
       /\ pc0' = 5
       /\ intr0' = intr0
       /\ intr1' = intr1
       /\ turn' = turn
       /\ ~ (turn = 1 /\ intr1 = 1)
       

       
l56 == /\ pc0 = 5
       /\ pc0' = 6
       /\ intr0' = intr0
       /\ intr1' = intr1
       /\ turn' = turn
       

l67 == /\ pc0 = 6
       /\ pc0' = 7
       /\ intr0' = 0
       /\ intr1' = intr1
       /\ turn' = turn
       

      
l70 == /\ pc0 = 7
       /\ pc0' = 0
       /\ intr0' = intr0
       /\ intr1' = intr1
       /\ turn' = turn 
       

       
m01 == /\ pc1 = 0
       /\ pc1' = 1
       /\ turn' = turn
       /\ intr1' = intr1
       /\ intr0' = intr0  
         
m12 == /\ pc1 = 1
       /\ pc1' = 2
       /\ turn' = turn
       /\ intr1' = intr1
       /\ intr0' = intr0

m23 == /\ pc1 = 2
       /\ pc1' = 3
       /\ turn' = turn
       /\ intr1' = 1
       /\ intr0' = intr0

m34 == /\ pc1 = 3
       /\ pc1' = 4
       /\ turn' = 1
       /\ intr1' = intr1
       /\ intr0' = intr0
      

m44 == /\ pc1 = 4
       /\ pc1' = 4
       /\ turn = 0
       /\ intr0 = 1
       /\ turn' = turn
       /\ intr1' = intr1
       /\ intr0' = intr0    
      

m45 == /\ pc1 = 4
       /\ pc1' = 5
       /\ intr1' = intr1
       /\ intr0' = intr0
       /\ turn' = turn
       /\ ~ (turn = 0 /\ intr1 = 1)

m56 == /\ pc1 = 5
       /\ pc1' = 6
       /\ intr1' = intr1
       /\ intr0' = intr0
       /\ turn' = turn
       

m67 == /\ pc1 = 6
       /\ pc1' = 7
       /\ intr1' = 0
       /\ intr0' = intr0
       /\ turn' = turn

m70 == /\ pc1 = 7
       /\ pc1' = 0
       /\ intr1' = intr1
       /\ intr0' = intr0
       /\ turn' = turn  
       


SLOGP == UNCHANGED <<pc0, intr0, intr1, turn>>
SLOGQ == UNCHANGED <<pc1, intr0, intr1, turn>>  

ro0 == \/ l01
       \/ l12
       \/ l23
       \/ l34
       \/ l44
       \/ l45
       \/ l56
       \/ l67
       \/ l70
       \/ SLOGP
       
ro1 == \/ m01
       \/ m12
       \/ m23
       \/ m34
       \/ m44
       \/ m45
       \/ m56
       \/ m67
       \/ m70
       \/ SLOGQ
       
\* donot add L12 because it can stuck in non critical section forever.
\* add l45 because semantics of weak fairness and jsutice conditions are different.  
WEAK_FAIRNESS_pc0 == /\ WF_pc0(l01)
                    /\ WF_pc0(l23)
                    /\ WF_pc0(l34)
                    /\ WF_pc0(l45)
                    /\ WF_pc0(l56)
                    /\ WF_pc0(l67)
                    /\ WF_pc0(l70)
                    
WEAK_FAIRNESS_pc1 == /\ WF_pc1(m01)
                    /\ WF_pc1(m23)
                    /\ WF_pc1(m34)
                    /\ WF_pc1(m45)
                    /\ WF_pc1(m56)
                    /\ WF_pc1(m67)
                    /\ WF_pc0(l70)
                   
vars == << pc0, pc1, intr0, intr1, turn >>                   

Next == \/ (ro0 /\ pc1' = pc1)
        \/ (ro1 /\ pc0' = pc0)
        
FAIRNESS_CONDITION == /\ Init
                      /\ [][Next]_vars
                      /\ WEAK_FAIRNESS_pc0
                      /\ WEAK_FAIRNESS_pc1
                      
                      
\* check whether for all runs sarisfy starvation freeness. 
NO_STARVATION_0 == [] ((pc0 = 4) => <> (pc0 = 5))
NO_STARVATION_1 == [] ((pc1 = 4) => <> (pc1 = 5))
                    



=============================================================================
\* Modification History
\* Last modified Tue Apr 23 17:09:03 IST 2024 by amithabh_a
\* Created Mon Feb 05 13:48:01 IST 2024 by amithabh_a

