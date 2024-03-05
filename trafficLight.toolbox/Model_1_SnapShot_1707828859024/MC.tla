---- MODULE MC ----
EXTENDS trafficLight, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_17078288549016000 ==
~(light1 = 0 /\ light2 = 0)
----
=============================================================================
\* Modification History
\* Created Tue Feb 13 18:24:14 IST 2024 by amithabh_a
