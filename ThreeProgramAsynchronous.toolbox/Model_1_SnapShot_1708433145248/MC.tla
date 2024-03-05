---- MODULE MC ----
EXTENDS ThreeProgramAsynchronous, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_17084331305237000 ==
~(/\ x = 2
/\ pc3 = 4
/\ pc1 = 4
/\ pc2 = 4)
----
=============================================================================
\* Modification History
\* Created Tue Feb 20 18:15:30 IST 2024 by amithabh_a
