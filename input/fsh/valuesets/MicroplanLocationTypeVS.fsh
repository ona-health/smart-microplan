// ABOUTME: ValueSet for campaign location hierarchy levels.
// ABOUTME: Binds to MicroplanLocation.type and targetLocationType extension.

ValueSet: MicroplanLocationTypeVS
Title: "Microplan Location Type ValueSet"
Description: "Administrative levels in the immunization campaign location hierarchy."

* ^experimental = false
* ^status = #draft

* include codes from system MicroplanLocationTypeCS
