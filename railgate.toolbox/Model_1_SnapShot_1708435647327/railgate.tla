------------------------------ MODULE railgate ------------------------------


EXTENDS Integers

VARIABLES gate, train, controller

TypeOK == /\ gate \in {"up", "down"}
          /\ train \in {"far", "near", "in"}
          /\ controller \in 0..3
          

Init == /\ gate = "up" \* gate is in up state
        /\ train = "far" \* Train in far state
        /\ controller = 0 \* controller in 0 state
        

LowerGate == /\ gate = "up"
             /\ gate' = "down"
             
RaiseGate == /\ gate = "down"
             /\ gate' = "up"
             
ApproachTrain == /\ train = "far"
                 /\ train' = "near"

\*EnterTrain == /\ train = "near"
\*              /\ train' = "in"

EnterTrain == IF train = "near"
              THEN train' = "in"
              ELSE UNCHANGED<<train>>

\*ExitTrain == /\ train = "in"
\*             /\ train' = "far"
              
ExitTrain == IF train = "in"
              THEN train' = "far"
              ELSE UNCHANGED<<train>>


\*ControllerApproach == /\ controller = 0
\*                     /\ controller' = 1

ControllerApproach == IF controller = 0
                      THEN controller' = 1
                      ELSE UNCHANGED<<controller>>
                     
\*ControllerLower == /\ controller = 1
\*                  /\ controller' = 2

ControllerLower == IF controller = 1
                  THEN controller' = 2
                  ELSE UNCHANGED<<controller>>
                  
\*ControllerExit == /\ controller = 2
\*                 /\ controller' = 3

ControllerExit == IF controller = 2
                  THEN controller' = 3
                  ELSE UNCHANGED<<controller>>

\*ControllerRaise == /\ controller = 3
\*                  /\ controller' = 0

ControllerRaise == IF controller = 3
                   THEN controller' = 0
                   ELSE UNCHANGED<<controller>>

Approach ==  /\ ControllerApproach
             /\ ApproachTrain
             /\ UNCHANGED<<gate>>
             
Lower == /\ LowerGate
         /\ ControllerLower
         /\ UNCHANGED<<train>>
         
Exit == /\ ExitTrain
        /\ ControllerExit
        /\ UNCHANGED<<gate>>
        
Raise == /\ RaiseGate
         /\ ControllerRaise
         /\ UNCHANGED<<train>>

Enter == /\ EnterTrain
         /\ UNCHANGED<<gate, controller>>


Next == \/ Approach
        \/ Lower
        \/ Exit
        \/ Raise
        \/ Enter

SafetyCheck == ~(train = "in" /\ gate = "up")




=============================================================================
\* Modification History
\* Last modified Tue Feb 20 18:57:17 IST 2024 by amithabh_a
\* Created Tue Feb 20 17:23:09 IST 2024 by amithabh_a
