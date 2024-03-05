---------------------------- MODULE trafficLight ----------------------------

EXTENDS Integers

VARIABLES light1, light2, counter, pc0, pc1

TypeOK == /\ light1 \in 0..1
          /\ light2 \in 0..1
          /\ counter \in 0..20

Init == /\ light1 = 1
        /\ light2 = 0
        /\ counter = 20
        /\ pc0 = 0
        /\ pc1 = 0

(* --------------------------------------------------- *)
      
l01 == /\ pc0 = 0
       /\ pc0' = 1
       /\ UNCHANGED << counter, light1, light2 >>
       
l12 == /\ pc0 = 1
       /\ pc0' = 2
       /\ counter = 0
       /\ UNCHANGED << counter, light1, light2 >>

l14 == /\ pc0 = 1
       /\ pc0' = 4
       /\ counter /= 0
       /\ UNCHANGED << counter, light1, light2 >>

l23 == /\ pc0 = 2
       /\ pc0' = 3
       /\ light1' = 1-light1
       /\ UNCHANGED << counter, light2 >>
       
l35 == /\ pc0 = 3
       /\ pc0' = 5
       /\ counter = 0
       /\ counter' = 20
       /\ UNCHANGED << light1, light2 >>

l45 == /\ pc0 = 4
       /\ pc0' = 5
       /\ counter' = counter - 1
       /\ UNCHANGED << light1, light2 >>

l50 == /\ pc0 = 5
       /\ pc0' = 0
       /\ UNCHANGED << counter, light1, light2 >>

(* ----------------------------------------------------- *)

Next1 ==   (\/ l01
            \/ l12
            \/ l14
            \/ l23
            \/ l35
            \/ l45
            \/ l50)
        
(* --------------------------------------------------- *)
      
m01 == /\ pc1 = 0
       /\ pc1' = 1
       /\ UNCHANGED << counter, light1, light2 >>
       
m12 == /\ pc1 = 1
       /\ pc1' = 2
       /\ counter = 0
       /\ UNCHANGED << counter, light1, light2 >>

m14 == /\ pc1 = 1
       /\ pc1' = 4
       /\ counter /= 0
       /\ UNCHANGED << counter, light1, light2 >>

m23 == /\ pc1 = 2
       /\ pc1' = 3
       /\ light2' = 1-light2
       /\ UNCHANGED << counter, light1 >>
       
m35 == /\ pc1 = 3
       /\ pc1' = 5
       /\ counter = 0
       /\ counter' = 20
       /\ UNCHANGED << light1, light2 >>

m45 == /\ pc1 = 4
       /\ pc1' = 5
       /\ counter' = counter - 1
       /\ UNCHANGED << light1, light2 >>

m50 == /\ pc1 = 5
       /\ pc1' = 0
       /\ UNCHANGED << counter, light1, light2 >>

(* ----------------------------------------------------- *)

Next2 ==    (\/ m01
             \/ m12
             \/ m14
             \/ m23
             \/ m35
             \/ m45
             \/ m50)
        
(* ----------------------------------------------------- *)


Next == (Next1 /\ Next2)


=============================================================================
\* Modification History
\* Last modified Tue Feb 13 17:37:37 IST 2024 by amithabh_a
\* Created Tue Feb 13 16:39:24 IST 2024 by amithabh_a
