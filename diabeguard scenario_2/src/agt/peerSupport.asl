
// Belief 
life_expiriences(["Patient A expirience", "Patient B expirience", "Patient C expirience"]).
get_request_agent(0).
new_life_expirience(0).

// Desire
!send_life_expiriences.
!add_new_life_expirience. 

// Intentions

+retrive_life_expiriences[source(AGENT)]:true 
    <-
    -+get_request_agent(AGENT);
    .print("A request came from ", AGENT, " to list all expiriences").

+!send_life_expiriences: true
    <-
    .wait(1);
    ?get_request_agent(AGENT);
    ?life_expiriences(Exp);
    .send(AGENT, tell, patient_expirience(Exp));
    .print("Patients Expiriences sent to agent : ", AGENT).

+new_expiriences(NewExpirience)[source(AGENT2)]: true
    <-
    -+new_life_expirience(NewExpirience).
    
+!add_new_life_expirience: true 
    <-
    .wait(500);
    ?life_expiriences(OldList);
    ?new_life_expirience(NewExpirience);
    NewList = [NewExpirience | OldList];
    -+life_expiriences(NewList);
    .print("New Patients Expiriences : ", NewList).