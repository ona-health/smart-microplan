// ABOUTME: Task profile for a concrete campaign activity at a specific location.
// ABOUTME: Generated from PlanDefinition actions, one per activity per target location.

Profile: MicroplanTask
Parent: Task
Id: microplan-task
Title: "Microplan Task"
Description: "A concrete campaign activity assigned to a team at a specific location and time."

* ^status = #draft
* ^experimental = false

* status MS
* intent MS
* basedOn 1..* MS
* basedOn only Reference(MicroplanCarePlan)
* focus 1..1 MS
* focus only Reference(ActivityDefinition)
* for 1..1 MS
* for only Reference(MicroplanTargetPopulation)
* location 1..1 MS
* location only Reference(MicroplanLocation)
* executionPeriod 1..1 MS
* owner MS
* input MS
* output MS
