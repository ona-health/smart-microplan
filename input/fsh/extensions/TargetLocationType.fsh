// ABOUTME: Extension on PlanDefinition.action to specify which location hierarchy level
// ABOUTME: an activity targets for Task generation.

Extension: TargetLocationType
Title: "Target Location Type"
Description: "Specifies which level of the location hierarchy a PlanDefinition action targets for Task generation."
Context: PlanDefinition.action

* ^status = #draft
* ^experimental = false

* value[x] only CodeableConcept
* valueCodeableConcept from MicroplanLocationTypeVS (required)
