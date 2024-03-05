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

EnterTrain == /\ train = "near"
              /\ train' = "in"

ExitTrain == /\ train = "in"
             /\ train' = "far"

ControllerApproach == /\ controller = 0
                     /\ controller' = 1
                     
ControllerLower == /\ controller = 1
                  /\ controller' = 2
                  
ControllerExit == /\ controller = 2
                 /\ controller' = 3

ControllerRaise == /\ controller = 3
                  /\ controller' = 0

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

SafetyCheck == ~(train = "in" /\ gate = "down")


=============================================================================
\* Modification History
\* Last modified Tue Feb 20 18:40:52 IST 2024 by amithabh_a
\* Created Tue Feb 20 17:23:09 IST 2024 by amithabh_a
