// ABOUTME: Location profile for the campaign location hierarchy.
// ABOUTME: Each level (country through vaccination site) is differentiated by type coding.

Profile: MicroplanLocation
Parent: Location
Id: microplan-location
Title: "Microplan Location"
Description: "A location in the immunization campaign hierarchy, from country down to vaccination site."

* ^status = #draft
* ^experimental = false

* name 1..1
* type 1..* MS
* type from MicroplanLocationTypeVS (required)
* partOf MS
* partOf only Reference(MicroplanLocation)
* position MS
* managingOrganization MS
