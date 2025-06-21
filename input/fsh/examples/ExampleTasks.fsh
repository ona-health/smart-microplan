// ABOUTME: Example Tasks generated from the Polio SIA campaign PlanDefinition.
// ABOUTME: Demonstrates vaccination, supervision, and coverage monitoring tasks.

Instance: ExampleTaskVaccinationAlpha
InstanceOf: MicroplanTask
Title: "Vaccination Session — Site Alpha, Day 1"
Description: "OPV vaccination session at Site Alpha on campaign day 1."
Usage: #example

* status = #requested
* intent = #plan
* basedOn = Reference(ExampleCarePlan)
* focus = Reference(PolioVaccinationSession)
* for = Reference(ExamplePopulationSiteAlpha)
* location = Reference(ExampleSiteAlpha)
* executionPeriod
  * start = 2025-06-21
  * end = 2025-06-21
* input[+]
  * type.text = "vaccine"
  * valueString = "bOPV"
* input[+]
  * type.text = "target-count"
  * valueInteger = 500

Instance: ExampleTaskVaccinationBeta
InstanceOf: MicroplanTask
Title: "Vaccination Session — Site Beta, Day 1"
Description: "OPV vaccination session at Site Beta on campaign day 1."
Usage: #example

* status = #requested
* intent = #plan
* basedOn = Reference(ExampleCarePlan)
* focus = Reference(PolioVaccinationSession)
* for = Reference(ExamplePopulationSiteBeta)
* location = Reference(ExampleSiteBeta)
* executionPeriod
  * start = 2025-06-21
  * end = 2025-06-21
* input[+]
  * type.text = "vaccine"
  * valueString = "bOPV"
* input[+]
  * type.text = "target-count"
  * valueInteger = 750

Instance: ExampleTaskSupervision
InstanceOf: MicroplanTask
Title: "Supervision Visit — Riverside District, Day 2"
Description: "Supervisor monitoring visit for Riverside District on campaign day 2."
Usage: #example

* status = #requested
* intent = #plan
* basedOn = Reference(ExampleCarePlan)
* focus = Reference(SupervisionVisit)
* for = Reference(ExamplePopulationDistrict)
* location = Reference(ExampleDistrict)
* executionPeriod
  * start = 2025-06-22
  * end = 2025-06-22

Instance: ExampleTaskCoverageMonitoring
InstanceOf: MicroplanTask
Title: "Coverage Monitoring — Riverside Health Center"
Description: "Post-campaign rapid coverage monitoring at Riverside Health Center catchment."
Usage: #example

* status = #requested
* intent = #plan
* basedOn = Reference(ExampleCarePlan)
* focus = Reference(CoverageMonitoring)
* for = Reference(ExamplePopulationDistrict)
* location = Reference(ExampleFacility)
* executionPeriod
  * start = 2025-06-25
  * end = 2025-06-25
