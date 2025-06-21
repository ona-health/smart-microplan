// ABOUTME: Group profile for estimated target population at a location.
// ABOUTME: Defines eligibility criteria and estimated count for campaign planning.

Profile: MicroplanTargetPopulation
Parent: Group
Id: microplan-target-population
Title: "Microplan Target Population"
Description: "Estimated target population for vaccination at a specific location."

* ^status = #draft
* ^experimental = false

* type = #person
* actual = false
* characteristic 1..* MS
* quantity 1..1 MS
* extension contains CampaignLocation named campaignLocation 0..1 MS
* managingEntity MS
