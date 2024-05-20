
// Belief 
life_expiriences(["Nothing"]).

// Desire
!get_life_expiriences.

// Intentions

+!get_life_expiriences: true
    <-
    .send(peerSupport, tell, check_life_expiriences);
    .print("Asked patients expirience from peerSupport agent").

+patient_expirience(Expirience) : true
    <-
    .print("Patient expirience recieved: ", Expirience).