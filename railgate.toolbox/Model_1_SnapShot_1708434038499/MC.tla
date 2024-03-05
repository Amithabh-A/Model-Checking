---- MODULE MC ----
EXTENDS railgate, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_17084340344199000 ==
~(train = 2 /\ gate = 0)
----
=============================================================================
\* Modification History
\* Created Tue Feb 20 18:30:34 IST 2024 by amithabh_a
