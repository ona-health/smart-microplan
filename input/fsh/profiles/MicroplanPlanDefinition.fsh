// ABOUTME: PlanDefinition profile for campaign templates.
// ABOUTME: Defines campaign activities with level-targeted actions that drive Task generation.

Profile: MicroplanPlanDefinition
Parent: PlanDefinition
Id: microplan-plandefinition
Title: "Microplan PlanDefinition"
Description: "A campaign template that defines activities and which location hierarchy levels they target."

* ^status = #draft
* ^experimental = false

* status MS
* type 1..1 MS
* title 1..1 MS
* description 1..1 MS
* goal MS
* action 1..* MS
* action.title 1..1 MS
* action.description MS
* action.extension contains TargetLocationType named targetLocationType 1..1 MS
* action.definitionCanonical MS
* action.relatedAction MS
* action.participant MS
