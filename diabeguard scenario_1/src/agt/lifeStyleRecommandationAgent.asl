// Belief

low_risk_score_message("Maintain current lifestyle").
high_risk_score_message("Increase physical activity").
low_genetic_score_message("No medications needed").
high_genetic_score_message("Take Metformin 20mg every night").
risk_score(0).
genetic_score(0).
lifestyle_changes(0).
medication_changes(0).

// Desire

!calculate_lifestyle_changes.
!send_messages.

// Intention

+risk_info(RiskScore, GeneticScore) : true <-
    -+risk_score(RiskScore);
    -+genetic_score(GeneticScore);
    .print("Received risk scores: ", RiskScore);
    .print("Received genetic scores: ", GeneticScore).
    

+!calculate_lifestyle_changes : true <-
    .wait(150);
    ?low_risk_score_message(MESSAGE1);
    ?high_risk_score_message(MESSAGE2);
    ?low_genetic_score_message(MESSAGE3);
    ?high_genetic_score_message(MESSAGE4);
    (if (RiskScore < 80) {
        LifestyleChanges = MESSAGE1;
    } else {
        LifestyleChanges = MESSAGE2;
    });
    (if (GeneticScore < 100) {
        Medication = MESSAGE3;
    } else {
        Medication = MESSAGE4;
    });
    -+lifestyle_changes(LifestyleChanges);
    -+medication_changes(Medication);
    .print("Lifestyle changes calculated").

+!send_messages: true <-
    .wait(200);
    ?lifestyle_changes(LifestyleChanges);
    ?medication_changes(Medication);
    .send(riskAssessmentAgent, tell, recommanded(LifestyleChanges, Medication));
    .print("Lifestyle changes sent to RiskAssessment").
