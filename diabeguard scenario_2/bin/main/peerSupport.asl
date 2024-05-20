
// Belief 
life_expiriences(["Patient 1 expirience", "Patient 2 expirience", "Patient 3 expirience"]).

// Desire


// Intentions

+check_life_expiriences[source(AGENT)]: true
    <-
    ?life_expiriences(Exp);
    .send(AGENT, tell, patient_expirience(Exp));
    .print("Patients Expiriences send to agent : ", AGENT).

+new_life_expiriences(NewExpirience)[source(AGENT)]: true
    <-
    ?life_expiriences(OldList);
    NewList = [NewExpirience | OldList];
    -+life_expiriences(NewList);
    .print("New Patients Expiriences added from agent : ", AGENT);
    .print("New Patients Expiriences : ", NewList).
