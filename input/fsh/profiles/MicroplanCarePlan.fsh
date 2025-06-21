// ABOUTME: CarePlan profile for an instantiated campaign in a specific geographic area.
// ABOUTME: References the PlanDefinition template, target area, population, and generated Tasks.

Profile: MicroplanCarePlan
Parent: CarePlan
Id: microplan-careplan
Title: "Microplan CarePlan"
Description: "An instantiated immunization campaign for a specific geographic area and time period."

* ^status = #draft
* ^experimental = false

* status MS
* intent MS
* title 1..1 MS
* period 1..1 MS
* instantiatesCanonical 1..* MS
* subject 1..1 MS
* subject only Reference(MicroplanTargetPopulation)
* extension contains CampaignLocation named campaignLocation 1..1 MS
* author MS
* activity MS
* activity.reference MS
