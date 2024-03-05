---- MODULE MC ----
EXTENDS ThreeProgramAsynchronous, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_170843679500920000 ==
~(/\ x = 2
/\ pc3 = 4
/\ pc1 = 4
/\ pc2 = 4)
----
=============================================================================
\* Modification History
\* Created Tue Feb 20 19:16:35 IST 2024 by amithabh_a
