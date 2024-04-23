----------------------------- MODULE semaphore -----------------------------

EXTENDS Integers

VARIABLES x, s0, s1

Init == /\ x = 1
        /\ s0 = 0
        /\ s1 = 0

\* ------------------------------

l01 == /\ s0 = 0
       /\ s0' = 1
       /\ UNCHANGED<<x>>

l12 == /\ s0 = 1
       /\ s0' = 2
       /\ UNCHANGED<<x>>

l23 == /\ s0 = 2
       /\ s0' = 3
       /\ x = 1
       /\ x' = 0

l34 == /\ s0 = 3
       /\ s0' = 4
       /\ UNCHANGED<<x>>

l45 == /\ s0 = 4
       /\ s0' = 5
       /\ x = 0
       /\ x' = 1

l50 == /\ s0 = 5
       /\ s0' = 0
       /\ UNCHANGED<<x>>

\* ------------------------------

m01 == /\ s1 = 0
       /\ s1' = 1
       /\ UNCHANGED<<x>>

m12 == /\ s1 = 1
       /\ s1' = 2
       /\ UNCHANGED<<x>>

m23 == /\ s1 = 2
       /\ s1' = 3
       /\ x = 1
       /\ x' = 0

m34 == /\ s1 = 3
       /\ s1' = 4
       /\ UNCHANGED<<x>>

m45 == /\ s1 = 4
       /\ s1' = 5
       /\ x = 0
       /\ x' = 1

m50 == /\ s1 = 5
       /\ s1' = 0
       /\ UNCHANGED<<x>>

rho0 == \/ l01
        \/ l12
        \/ l23
        \/ l34
        \/ l45 
        \/ l50

rho1 == \/ m01
        \/ m12
        \/ m23
        \/ m34
        \/ m45 
        \/ m50

WEAK_FAIRNESS == /\ WF_s0(l01)
                /\ WF_s0(l12)
                /\ WF_s0(l23)
                /\ WF_s0(l34)
                /\ WF_s0(l45)
                /\ WF_s0(l50)
                /\ WF_s1(m01)
                /\ WF_s1(m12)
                /\ WF_s1(m23)
                /\ WF_s1(m34)
                /\ WF_s1(m45)
                /\ WF_s1(m50)

Next == \/ (rho0 /\ UNCHANGED<<s1>>)
        \/ (rho1 /\ UNCHANGED<<s0>>)

vars == <<s0,s1,x>>

FAIRNESS_CONDITION == /\ Init
                      /\ [][Next]_vars
                      /\ WEAK_FAIRNESS

MUTEX == ~(s0 = 3 /\ s1 = 3)

NO_STARVATION_0 == [](s0 = 2 => <>(s0 = 3))
NO_STARVATION_1 == [](s1 = 2 => <>(s1 = 3))


=============================================================================
\* Modification History
\* Last modified Tue Mar 19 18:33:03 IST 2024 by amithabh_a
\* Created Tue Mar 05 17:45:34 IST 2024 by amithabh_a
