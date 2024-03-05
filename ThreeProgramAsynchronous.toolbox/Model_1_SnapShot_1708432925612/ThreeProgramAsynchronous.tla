---------------------- MODULE ThreeProgramAsynchronous ----------------------

EXTENDS Integers

VARIABLES k1,r1,x, pc1, k2,r2, pc2, k3,r3, pc3 

(* ----------------------------------------------------- *)      

Init1 == /\ k1 = 1
        /\ x = 0
        /\ r1 = 0
        /\ pc1 = 0

l01 == /\ pc1 = 0
       /\ pc1' = 1
       /\ k1 \in 1..5
       /\ k1' = k1 + 1
       /\ UNCHANGED << x, r1 >>
       
l12 == /\ pc1 = 1
       /\ pc1' = 2
       /\ r1' = x
       /\ UNCHANGED << k1, x >>
       
l23 == /\ pc1 = 2
       /\ pc1' = 3
       /\ r1' = r1 + 1
       /\ UNCHANGED << x, k1 >>

l30 == /\ pc1 = 3
       /\ pc1' = 0
       /\ x' = r1
       /\ UNCHANGED << k1, r1 >>
       
l04 == /\ pc1 = 0
       /\ pc1' = 4
       /\ \A s \in 1..5 : k1 /= s
       /\ UNCHANGED << r1, x, k1 >>
       
Next1 == \/ l01
         \/ l12
         \/ l23
         \/ l30
         \/ l04

(* ----------------------------------------------------- *)       


Init2 == /\ k2 = 1
         /\ x = 0
         /\ r2 = 0
         /\ pc2 = 0

m01 == /\ pc2 = 0
       /\ pc2' = 1
       /\ k2 \in 1..5
       /\ k2' = k2 + 1
       /\ UNCHANGED << x, r2 >>
       
m12 == /\ pc2 = 1
       /\ pc2' = 2
       /\ r2' = x
       /\ UNCHANGED << k2, x >>
       
m23 == /\ pc2 = 2
       /\ pc2' = 3
       /\ r2' = r2 + 1
       /\ UNCHANGED << x, k2 >>

m30 == /\ pc2 = 3
       /\ pc2' = 0
       /\ x' = r2
       /\ UNCHANGED << k2, r2 >>
       
m04 == /\ pc2 = 0
       /\ pc2' = 4
       /\ \A s \in 1..5 : k2 /= s
       /\ UNCHANGED << r2, x, k2 >>
       
Next2 == \/ m01
         \/ m12
         \/ m23
         \/ m30 
         \/ m04

(* ----------------------------------------------------- *)       


Init3 == /\ k3 = 1
         /\ x = 0
         /\ r3 = 0
         /\ pc3 = 0

n01 == /\ pc3 = 0
       /\ pc3' = 1
       /\ k3 \in 1..5
       /\ k3' = k3 + 1
       /\ UNCHANGED << x, r3 >>
       
n12 == /\ pc3 = 1
       /\ pc3' = 2
       /\ r3' = x
       /\ UNCHANGED << k3, x >>
       
n23 == /\ pc3 = 2
       /\ pc3' = 3
       /\ r3' = r3 + 1
       /\ UNCHANGED << x, k3 >>

n30 == /\ pc3 = 3
       /\ pc3' = 0
       /\ x' = r3
       /\ UNCHANGED << k3, r3 >>

n04 == /\ pc3 = 0
       /\ pc3' = 4
       /\ \A s \in 1..5 : k3 /= s
       /\ UNCHANGED << r3, x, k3 >>
       
Next3 == \/ n01
         \/ n12
         \/ n23
         \/ n30 
         \/ n04

(* ----------------------------------------------------- *)       

Init == /\ Init1
        /\ Init2
        /\ Init3

Next == \/ (Next1 /\ UNCHANGED << k2, r2, pc2, k3, r3, pc3 >>)
        \/ (Next2 /\ UNCHANGED << k1, r1, pc1, k3, r3, pc3 >>)
        \/ (Next3 /\ UNCHANGED << k1, r1, pc1, k2, r2, pc2 >>)
        



=============================================================================
\* Modification History
\* Last modified Tue Feb 13 19:36:09 IST 2024 by amithabh_a
\* Created Tue Feb 13 18:12:03 IST 2024 by amithabh_a
