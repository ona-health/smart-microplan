# SMART Microplan Implementation Guide — Design Spec

## Overview

A FHIR Implementation Guide for microplanning immunization campaigns. The initial scope is a **Polio Supplementary Immunization Activity (SIA)** — a mass campaign targeting children 0–59 months in defined geographic areas.

The IG sits on top of the WHO SMART Immunizations IG, adding the **population/location-centric planning layer** that the existing IG lacks. Where smart-immunizations models individual vaccine eligibility, this IG models campaign planning, task generation, and execution tracking.

**Status: DRAFT**
**FHIR version: 4.0.1**
**Dependencies:** smart.who.int.base, hl7.fhir.uv.cpg

---

## Resource Model

```
PlanDefinition (campaign template)
  ──$apply──▶
CarePlan (instantiated campaign for a geographic area)
  ──generates──▶
Task[] (one per activity per target location)
  ──references──▶
Location (hierarchy: country → province → district → facility → site)
Group (estimated target population per location)
```

**Flow:** Define once (PlanDefinition) → Instantiate per area (CarePlan) → Generate per site (Tasks) → Execute and report.

---

## Location Hierarchy

Locations use `Location.partOf` to form a chain:

```
Country
  └── Province (partOf → Country)
      └── District (partOf → Province)
          └── Health Facility (partOf → District)
              └── Vaccination Site (partOf → Health Facility)
```

**Profile: `MicroplanLocation`**
- `partOf` — required (except country level), references parent Location
- `type` — required, coded from `MicroplanLocationTypeVS` (country | province | district | health-facility | vaccination-site)
- `name` — required
- `position` — optional, GPS coordinates
- `managingOrganization` — optional

The `type` coding drives Task generation — PlanDefinition actions specify which hierarchy level they target.

---

## PlanDefinition — Campaign Template

A single nested PlanDefinition with level-targeted actions:

**Profile: `MicroplanPlanDefinition`**
- `status` — active
- `type` — clinical-protocol
- `goal` — campaign coverage target (e.g., ≥95% OPV coverage in 0–59 months)

**Actions:**

| Action | ActivityDefinition | Target Location Level | Participant Role |
|---|---|---|---|
| Vaccination Session | polio-vaccination-session | vaccination-site | vaccination-team |
| Supervision Visit | supervision-visit | district | supervisor |
| Rapid Coverage Monitoring | coverage-monitoring | health-facility | monitoring-team |

Each action carries:
- `definitionCanonical` → ActivityDefinition
- Extension `targetLocationType` → coded hierarchy level
- `relatedAction` for sequencing (coverage monitoring after vaccination)
- `participant` with campaign role

---

## CarePlan — Instantiated Campaign

When a campaign is operationalized for a specific area:

**Profile: `MicroplanCarePlan`**
- `basedOn` — required, → PlanDefinition
- `subject` — required, → Group (aggregate target population)
- `addresses` — required, → Location (top-level area this plan covers)
- `period` — required, campaign dates
- `author` — responsible organization
- `activity.reference` — references to all generated Tasks
- `status` lifecycle: draft → active → completed
- `intent` — plan

**Instantiation flow ($apply):**
1. Select PlanDefinition + target Location (e.g., Eastern Province)
2. Create CarePlan for that Location + time period
3. Walk Location hierarchy under the target
4. For each action, find Locations matching `targetLocationType`
5. Generate Task per action per matching Location
6. Create Group per leaf Location with estimated target population
7. Attach all Task references to CarePlan

---

## Task — Activity at a Location

**Profile: `MicroplanTask`**
- `basedOn` — required, → CarePlan
- `focus` — required, → ActivityDefinition
- `for` — required, → Group (target population at this location)
- `location` — required, → Location
- `executionPeriod` — required, when this happens
- `owner` — assigned team/person
- `status` lifecycle: requested → accepted → in-progress → completed
- `input` — vaccine type, target count, supplies
- `output` — doses administered, children reached

**Generation rules:**

| Activity | One Task per |
|---|---|
| Vaccination Session | vaccination-site × campaign day |
| Supervision Visit | district × campaign day |
| Rapid Coverage Monitoring | health-facility (post-campaign) |

---

## Group — Target Population

**Profile: `MicroplanTargetPopulation`**
- `type` — fixed: person
- `actual` — fixed: false (estimated, not enumerated)
- `characteristic` — required, age range (0–59 months for polio)
- `quantity` — required, estimated count
- `managingEntity` — → Location

One Group per vaccination site. CarePlan-level Group aggregates the campaign area total. Coverage = `Task.output.children-reached / Group.quantity`.

---

## ActivityDefinitions

Three simple ActivityDefinitions:

1. **polio-vaccination-session** — Administer bOPV to all children 0–59 months at a vaccination site
2. **supervision-visit** — Supervisor monitors campaign execution at district level
3. **coverage-monitoring** — Post-campaign rapid coverage assessment at health facility catchment area

---

## Extensions

| Extension | Context | Type | Description |
|---|---|---|---|
| `targetLocationType` | PlanDefinition.action | code | Which Location hierarchy level this action generates Tasks at |

---

## Terminology

**CodeSystems:**
- `MicroplanLocationTypeCS` — country, province, district, health-facility, vaccination-site
- `MicroplanActivityTypeCS` — vaccination-session, supervision-visit, coverage-monitoring
- `MicroplanParticipantRoleCS` — vaccination-team, supervisor, monitoring-team

**ValueSets:**
- `MicroplanLocationTypeVS` — from MicroplanLocationTypeCS
- `MicroplanActivityTypeVS` — from MicroplanActivityTypeCS
- `MicroplanParticipantRoleVS` — from MicroplanParticipantRoleCS

---

## Examples

The IG includes a complete example chain:
- PlanDefinition for a Polio SIA campaign
- Location hierarchy (country → province → district → facility → 2 vaccination sites)
- CarePlan instantiating the campaign for a district
- Tasks generated for each activity at appropriate locations
- Groups with target population estimates per site

---

## Out of Scope (for now)

- Supply/logistics planning
- Social mobilization activities
- Preparation activities
- Person-level task targeting
- Multiple campaign types
- Multi-antigen campaigns
