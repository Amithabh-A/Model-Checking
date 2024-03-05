---- MODULE MC ----
EXTENDS peterson, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_170722740450937000 ==
~(pc0 = 5 /\ pc1 = 5)
----
=============================================================================
\* Modification History
\* Created Tue Feb 06 19:20:04 IST 2024 by amithabh_a
