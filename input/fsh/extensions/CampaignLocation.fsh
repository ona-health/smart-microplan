// ABOUTME: Extension to link a CarePlan or Group to a campaign Location.
// ABOUTME: Used where base FHIR elements don't allow Location references.

Extension: CampaignLocation
Title: "Campaign Location"
Description: "Links a resource to a location in the campaign hierarchy."
Context: CarePlan, Group

* ^status = #draft
* ^experimental = false

* value[x] only Reference(MicroplanLocation)
