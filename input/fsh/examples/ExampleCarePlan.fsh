// ABOUTME: Example CarePlan instantiating a Polio SIA campaign for Riverside District.
// ABOUTME: References the PlanDefinition, target area, population, and all generated Tasks.

Instance: ExampleCarePlan
InstanceOf: MicroplanCarePlan
Title: "Polio SIA — Riverside District, June 2025"
Description: "Instantiated Polio SIA campaign for Riverside District."
Usage: #example

* status = #active
* intent = #plan
* title = "Polio SIA — Riverside District, June 2025"
* period
  * start = 2025-06-21
  * end = 2025-06-25
* instantiatesCanonical = Canonical(PolioSIACampaign)
* subject = Reference(ExamplePopulationDistrict)
* extension[campaignLocation].valueReference = Reference(ExampleDistrict)

* activity[+].reference = Reference(ExampleTaskVaccinationAlpha)
* activity[+].reference = Reference(ExampleTaskVaccinationBeta)
* activity[+].reference = Reference(ExampleTaskSupervision)
* activity[+].reference = Reference(ExampleTaskCoverageMonitoring)
