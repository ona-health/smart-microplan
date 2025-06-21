// ABOUTME: Example location hierarchy for a Polio SIA campaign.
// ABOUTME: Demonstrates country → province → district → facility → vaccination sites.

Instance: ExampleCountry
InstanceOf: MicroplanLocation
Title: "Example Country"
Description: "Example country-level location."
Usage: #example

* name = "Wakanda"
* type = MicroplanLocationTypeCS#country "Country"
* status = #active

Instance: ExampleProvince
InstanceOf: MicroplanLocation
Title: "Eastern Province"
Description: "Example province-level location."
Usage: #example

* name = "Eastern Province"
* type = MicroplanLocationTypeCS#province "Province"
* status = #active
* partOf = Reference(ExampleCountry)

Instance: ExampleDistrict
InstanceOf: MicroplanLocation
Title: "Riverside District"
Description: "Example district-level location."
Usage: #example

* name = "Riverside District"
* type = MicroplanLocationTypeCS#district "District"
* status = #active
* partOf = Reference(ExampleProvince)

Instance: ExampleFacility
InstanceOf: MicroplanLocation
Title: "Riverside Health Center"
Description: "Example health facility."
Usage: #example

* name = "Riverside Health Center"
* type = MicroplanLocationTypeCS#health-facility "Health Facility"
* status = #active
* partOf = Reference(ExampleDistrict)

Instance: ExampleSiteAlpha
InstanceOf: MicroplanLocation
Title: "Site Alpha — Fixed Post"
Description: "Example fixed-post vaccination site."
Usage: #example

* name = "Site Alpha — Riverside Market"
* type = MicroplanLocationTypeCS#vaccination-site "Vaccination Site"
* status = #active
* partOf = Reference(ExampleFacility)
* position
  * latitude = -1.2921
  * longitude = 36.8219

Instance: ExampleSiteBeta
InstanceOf: MicroplanLocation
Title: "Site Beta — House-to-House"
Description: "Example house-to-house vaccination site area."
Usage: #example

* name = "Site Beta — Riverside Ward 3"
* type = MicroplanLocationTypeCS#vaccination-site "Vaccination Site"
* status = #active
* partOf = Reference(ExampleFacility)
* position
  * latitude = -1.2950
  * longitude = 36.8250
