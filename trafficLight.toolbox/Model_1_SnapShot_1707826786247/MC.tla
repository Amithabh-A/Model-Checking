---- MODULE MC ----
EXTENDS trafficLight, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_17078267821975000 ==
~(light1 = 0 /\ light2 = 0)
----
=============================================================================
\* Modification History
\* Created Tue Feb 13 17:49:42 IST 2024 by amithabh_a
