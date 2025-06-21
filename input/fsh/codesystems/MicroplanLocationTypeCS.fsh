// ABOUTME: Codes for the administrative levels in a campaign location hierarchy.
// ABOUTME: Used by MicroplanLocation.type and the targetLocationType extension.

CodeSystem: MicroplanLocationTypeCS
Title: "Microplan Location Type CodeSystem"
Description: "Administrative levels in the immunization campaign location hierarchy."

* ^experimental = false
* ^caseSensitive = true
* ^status = #draft

* #country "Country" "National level"
* #province "Province" "Province or region level"
* #district "District" "District level"
* #health-facility "Health Facility" "Health facility or health center"
* #vaccination-site "Vaccination Site" "Point of vaccination delivery (fixed post, transit point, house-to-house team area)"
