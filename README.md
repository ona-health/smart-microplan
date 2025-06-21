# WHO SMART Microplan Implementation Guide

A FHIR Implementation Guide for immunization campaign microplanning.

## Status

**Draft** — This IG is under active development and is not yet ready for implementation.

## Scope

This IG defines the planning and task-generation layer for immunization campaigns. The initial focus is on **Polio Supplementary Immunization Activities (SIA)** — mass campaigns targeting children 0–59 months in defined geographic areas.

### What this IG covers

- **Campaign definition** via PlanDefinition — what activities to perform and at which administrative level
- **Campaign instantiation** via CarePlan — operationalizing a campaign for a specific geographic area and time period
- **Task generation** via Task — concrete activities assigned to teams at specific locations
- **Location hierarchy** — country → province → district → health facility → vaccination site
- **Target population estimation** via Group — estimated eligible population per location

### Key resource flow

```
PlanDefinition (campaign template)
  → CarePlan (instantiated campaign for a geographic area)
    → Task[] (one per activity per target location)
      → Location (where)
      → Group (who — estimated target population)
```

### Activity types

1. **Vaccination sessions** — OPV administration at vaccination sites
2. **Supervision visits** — monitoring at district level
3. **Rapid coverage monitoring** — post-campaign assessment at health facility level

## Building

This IG is built using [FHIR Shorthand (FSH)](https://build.fhir.org/ig/HL7/fhir-shorthand/) and [SUSHI](https://fshschool.org/docs/sushi/).

```bash
# Install SUSHI
npm install -g fsh-sushi

# Compile FSH to FHIR JSON
sushi .

# Build the full IG (requires IG Publisher)
./_genonce.sh
```

## Dependencies

- FHIR 4.0.1
- HL7 Clinical Practice Guidelines (CPG) IG

## License

Creative Commons Zero v1.0 Universal (CC0-1.0)
