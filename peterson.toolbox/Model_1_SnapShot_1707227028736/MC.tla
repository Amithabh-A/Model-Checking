---- MODULE MC ----
EXTENDS peterson, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_170722702467934000 ==
~(pc0 = 5 /\ pc1 = 5)
----
=============================================================================
\* Modification History
\* Created Tue Feb 06 19:13:44 IST 2024 by amithabh_a
