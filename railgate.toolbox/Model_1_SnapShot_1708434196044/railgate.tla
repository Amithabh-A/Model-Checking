------------------------------ MODULE railgate ------------------------------


EXTENDS Integers

VARIABLES gate, train, controller

TypeOK == /\ gate \in 0..1
          /\ train \in 0..2
          /\ controller \in 0..3
          

Init == /\ gate = 0 \* gate is in up state
        /\ train = 0 \* Train in far state
        /\ controller = 0 \* controller in 0 state
        

LowerGate == /\ gate = 0
             /\ gate' = 1
             
RaiseGate == /\ gate = 1
             /\ gate' = 0
             
ApproachTrain == /\ train = 0
                 /\ train' = 1

EnterTrain == /\ train = 1
              /\ train' = 2

ExitTrain == /\ train = 2
             /\ train' = 0

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

SafetyCheck == ~(train = 2 /\ gate = 0)


=============================================================================
\* Modification History
\* Last modified Tue Feb 20 18:33:11 IST 2024 by amithabh_a
\* Created Tue Feb 20 17:23:09 IST 2024 by amithabh_a
