---- MODULE MC ----
EXTENDS ThreeProgramAsynchronous, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_170843708031022000 ==
~(/\ x = 2
/\ pc3 = 4
/\ pc1 = 4
/\ pc2 = 4)
----
=============================================================================
\* Modification History
\* Created Tue Feb 20 19:21:20 IST 2024 by amithabh_a
