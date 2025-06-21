// ABOUTME: Example target population groups for a Polio SIA campaign.
// ABOUTME: One per vaccination site plus an aggregate for the district.

Instance: ExamplePopulationSiteAlpha
InstanceOf: MicroplanTargetPopulation
Title: "Target Population — Site Alpha"
Description: "Estimated target population of children 0–59 months at Site Alpha."
Usage: #example

* type = #person
* actual = false
* quantity = 500
* extension[campaignLocation].valueReference = Reference(ExampleSiteAlpha)
* characteristic[+]
  * code = http://terminology.hl7.org/CodeSystem/usage-context-type#age "Age Range"
  * valueRange
    * low = 0 'mo' "months"
    * high = 59 'mo' "months"
  * exclude = false

Instance: ExamplePopulationSiteBeta
InstanceOf: MicroplanTargetPopulation
Title: "Target Population — Site Beta"
Description: "Estimated target population of children 0–59 months at Site Beta."
Usage: #example

* type = #person
* actual = false
* quantity = 750
* extension[campaignLocation].valueReference = Reference(ExampleSiteBeta)
* characteristic[+]
  * code = http://terminology.hl7.org/CodeSystem/usage-context-type#age "Age Range"
  * valueRange
    * low = 0 'mo' "months"
    * high = 59 'mo' "months"
  * exclude = false

Instance: ExamplePopulationDistrict
InstanceOf: MicroplanTargetPopulation
Title: "Target Population — Riverside District"
Description: "Aggregate estimated target population for the district campaign area."
Usage: #example

* type = #person
* actual = false
* quantity = 1250
* extension[campaignLocation].valueReference = Reference(ExampleDistrict)
* characteristic[+]
  * code = http://terminology.hl7.org/CodeSystem/usage-context-type#age "Age Range"
  * valueRange
    * low = 0 'mo' "months"
    * high = 59 'mo' "months"
  * exclude = false
