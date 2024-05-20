
// Belief 
life_expiriences("I have a very bad expirience").

// Desire
!send_life_expiriences.

// Intentions

+!send_life_expiriences: true
    <-
    ?life_expiriences(Expirience);
    .send(peerSupport, tell, new_life_expiriences(Expirience));
    .print("Sent new patients expirience to peerSupport agent").

+patient_expirience(Expirience) : true
    <-
    .print("Patient expirience recieved: ", Expirience).