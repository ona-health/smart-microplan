// ABOUTME: PlanDefinition for a Polio Supplementary Immunization Activity (SIA) campaign.
// ABOUTME: Defines three activities targeting different levels of the location hierarchy.

Instance: PolioSIACampaign
InstanceOf: MicroplanPlanDefinition
Title: "Polio SIA Campaign"
Description: "Campaign template for a Polio Supplementary Immunization Activity targeting children 0–59 months."
Usage: #definition

* status = #draft
* type = $planDefinitionType#clinical-protocol
* title = "Polio SIA Campaign"
* description = "Supplementary Immunization Activity for oral polio vaccine (bOPV) targeting children aged 0–59 months."
* date = 2025-06-21
* publisher = "World Health Organization (WHO)"

* goal[+]
  * description.text = "Achieve at least 95% OPV coverage in children 0–59 months in the target area."

* action[+]
  * title = "Vaccination Session"
  * description = "Conduct bOPV vaccination session at vaccination site for all children 0–59 months."
  * extension[targetLocationType].valueCodeableConcept = MicroplanLocationTypeCS#vaccination-site "Vaccination Site"
  * definitionCanonical = Canonical(PolioVaccinationSession)
  * participant[+]
    * type = #practitioner
    * role = MicroplanParticipantRoleCS#vaccination-team "Vaccination Team"

* action[+]
  * title = "Supervision Visit"
  * description = "Supervisor visits vaccination sites to monitor campaign execution and provide support."
  * extension[targetLocationType].valueCodeableConcept = MicroplanLocationTypeCS#district "District"
  * definitionCanonical = Canonical(SupervisionVisit)
  * participant[+]
    * type = #practitioner
    * role = MicroplanParticipantRoleCS#supervisor "Supervisor"

* action[+]
  * title = "Rapid Coverage Monitoring"
  * description = "Post-campaign rapid assessment of vaccination coverage at health facility catchment areas."
  * extension[targetLocationType].valueCodeableConcept = MicroplanLocationTypeCS#health-facility "Health Facility"
  * definitionCanonical = Canonical(CoverageMonitoring)
  * relatedAction[+]
    * actionId = "vaccination-session"
    * relationship = #after
  * participant[+]
    * type = #practitioner
    * role = MicroplanParticipantRoleCS#monitoring-team "Monitoring Team"
