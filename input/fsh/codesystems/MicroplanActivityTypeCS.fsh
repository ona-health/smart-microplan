// ABOUTME: Codes for the types of activities in an immunization campaign.
// ABOUTME: Used to classify PlanDefinition actions and generated Tasks.

CodeSystem: MicroplanActivityTypeCS
Title: "Microplan Activity Type CodeSystem"
Description: "Types of activities performed during an immunization campaign."

* ^experimental = false
* ^caseSensitive = true
* ^status = #draft

* #vaccination-session "Vaccination Session" "Administration of vaccines to the target population at a vaccination site"
* #supervision-visit "Supervision Visit" "Supervisory monitoring visit during campaign execution"
* #coverage-monitoring "Rapid Coverage Monitoring" "Post-campaign assessment of vaccination coverage"
