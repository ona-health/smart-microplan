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

### Artifact Index

For a complete listing of artifacts defined in this guide, see the [Artifact Index](artifacts.html).
