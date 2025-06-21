This Implementation Guide defines FHIR resources for microplanning immunization campaigns. It provides the population and location-centric planning layer that complements individual-focused immunization IGs.

<div>
<p>This implementation guide is under active development and is not yet ready for implementation.</p>
</div>{:.stu-note}

### Scope

The initial focus is on **Polio Supplementary Immunization Activities (SIA)** — mass campaigns targeting children 0–59 months in defined geographic areas. The design supports extension to other campaign types.

### Resource Flow

The IG models campaign planning as a three-step process:

1. **Define** — A [PlanDefinition](StructureDefinition-microplan-plandefinition.html) describes the campaign template: what activities to perform and at which level of the location hierarchy.
2. **Instantiate** — A [CarePlan](StructureDefinition-microplan-careplan.html) operationalizes the campaign for a specific geographic area and time period.
3. **Execute** — [Tasks](StructureDefinition-microplan-task.html) are generated for each activity at each target location, assigned to teams, and tracked through completion.

Supporting resources:
- [Locations](StructureDefinition-microplan-location.html) form a hierarchy from country down to vaccination site.
- [Groups](StructureDefinition-microplan-target-population.html) represent estimated target populations at each location.

### Campaign Activities

The Polio SIA campaign template defines three activities:

| Activity | Target Level | Description |
|---|---|---|
| Vaccination Session | Vaccination Site | Administer bOPV to children 0–59 months |
| Supervision Visit | District | Monitor and support campaign execution |
| Rapid Coverage Monitoring | Health Facility | Post-campaign coverage assessment |

### How to Use This Guide

- **Campaign planners**: Use the PlanDefinition as a template. Create a CarePlan for your target area and generate Tasks for each site.
- **System implementers**: Use the profiles to validate campaign planning data. Implement the $apply operation to automate Task generation from PlanDefinitions.
- **Country adapters**: Customize the location hierarchy, activity definitions, and target population criteria for your context.

### Dependencies

This IG depends on:
- [HL7 Clinical Practice Guidelines (CPG)](http://hl7.org/fhir/uv/cpg/)

### Profiles

| Profile | Based On | Description |
|---|---|---|
| [Microplan PlanDefinition](StructureDefinition-microplan-plandefinition.html) | PlanDefinition | Campaign template with level-targeted actions |
| [Microplan CarePlan](StructureDefinition-microplan-careplan.html) | CarePlan | Instantiated campaign for a geographic area |
| [Microplan Task](StructureDefinition-microplan-task.html) | Task | Concrete activity at a specific location and time |
| [Microplan Location](StructureDefinition-microplan-location.html) | Location | Location in the campaign hierarchy |
| [Microplan Target Population](StructureDefinition-microplan-target-population.html) | Group | Estimated target population at a location |

### Extensions

| Extension | Context | Description |
|---|---|---|
| [Target Location Type](StructureDefinition-TargetLocationType.html) | PlanDefinition.action | Which hierarchy level an action generates Tasks at |
| [Campaign Location](StructureDefinition-CampaignLocation.html) | CarePlan, Group | Links a resource to a campaign Location |

### Activity Definitions

| Activity | Description |
|---|---|
| [Polio Vaccination Session](ActivityDefinition-PolioVaccinationSession.html) | Administer bOPV at vaccination sites |
| [Supervision Visit](ActivityDefinition-SupervisionVisit.html) | Monitor campaign execution at district level |
| [Rapid Coverage Monitoring](ActivityDefinition-CoverageMonitoring.html) | Post-campaign coverage assessment |

### Terminology

| Resource | Description |
|---|---|
| [Location Type CodeSystem](CodeSystem-MicroplanLocationTypeCS.html) | Campaign location hierarchy levels |
| [Activity Type CodeSystem](CodeSystem-MicroplanActivityTypeCS.html) | Types of campaign activities |
| [Participant Role CodeSystem](CodeSystem-MicroplanParticipantRoleCS.html) | Roles of campaign participants |

### Examples

| Resource | Description |
|---|---|
| [Polio SIA Campaign](PlanDefinition-PolioSIACampaign.html) | Campaign template for Polio SIA |
| [Polio SIA — Riverside District](CarePlan-ExampleCarePlan.html) | Instantiated campaign |
| [Vaccination — Site Alpha](Task-ExampleTaskVaccinationAlpha.html) | Vaccination task at a site |
| [Vaccination — Site Beta](Task-ExampleTaskVaccinationBeta.html) | Vaccination task at a site |
| [Supervision — Riverside District](Task-ExampleTaskSupervision.html) | Supervision task |
| [Coverage Monitoring — Riverside HC](Task-ExampleTaskCoverageMonitoring.html) | Coverage monitoring task |
| [Location Hierarchy](Location-ExampleCountry.html) | Country → Province → District → Facility → Sites |
| [Target Population — Site Alpha](Group-ExamplePopulationSiteAlpha.html) | Estimated 500 children |

### Artifact Index

For a complete listing of artifacts defined in this guide, see the [Artifact Index](artifacts.html).
