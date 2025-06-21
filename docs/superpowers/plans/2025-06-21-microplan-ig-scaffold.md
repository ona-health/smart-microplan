# SMART Microplan IG Scaffold — Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Scaffold a draft FHIR IG for immunization campaign microplanning, starting with a Polio SIA campaign.

**Architecture:** SUSHI-based FHIR IG following WHO SMART Guidelines patterns from smart-immunizations. PlanDefinition → CarePlan → Task workflow with Location hierarchy and Group-based population estimates.

**Tech Stack:** FHIR Shorthand (FSH), SUSHI, FHIR 4.0.1, HL7 CPG IG dependency

---

## Chunk 1: IG Scaffolding and Terminology

### Task 1: Create sushi-config.yaml and build files

**Files:**
- Create: `sushi-config.yaml`
- Create: `ig.ini`
- Create: `.gitignore`
- Create: `_genonce.sh`
- Create: `README.md`

- [ ] **Step 1:** Create sushi-config.yaml with id `smart.who.int.microplan`, canonical `http://smart.who.int/microplan`, status draft, FHIR 4.0.1, dependencies on smart.who.int.base and hl7.fhir.uv.cpg
- [ ] **Step 2:** Create ig.ini pointing to generated IG JSON
- [ ] **Step 3:** Create .gitignore matching smart-immunizations pattern
- [ ] **Step 4:** Create _genonce.sh build script
- [ ] **Step 5:** Create README.md describing the IG
- [ ] **Step 6:** Commit

### Task 2: Create CodeSystems and ValueSets

**Files:**
- Create: `input/fsh/Aliases.fsh`
- Create: `input/fsh/codesystems/MicroplanLocationTypeCS.fsh`
- Create: `input/fsh/codesystems/MicroplanActivityTypeCS.fsh`
- Create: `input/fsh/codesystems/MicroplanParticipantRoleCS.fsh`
- Create: `input/fsh/valuesets/MicroplanLocationTypeVS.fsh`
- Create: `input/fsh/valuesets/MicroplanActivityTypeVS.fsh`
- Create: `input/fsh/valuesets/MicroplanParticipantRoleVS.fsh`

- [ ] **Step 1:** Create Aliases.fsh with common FHIR aliases
- [ ] **Step 2:** Create 3 CodeSystems (LocationType, ActivityType, ParticipantRole)
- [ ] **Step 3:** Create 3 ValueSets (one per CodeSystem)
- [ ] **Step 4:** Run `sushi .` to validate
- [ ] **Step 5:** Commit

## Chunk 2: Profiles and Extensions

### Task 3: Create extension and profiles

**Files:**
- Create: `input/fsh/extensions/TargetLocationType.fsh`
- Create: `input/fsh/profiles/MicroplanLocation.fsh`
- Create: `input/fsh/profiles/MicroplanPlanDefinition.fsh`
- Create: `input/fsh/profiles/MicroplanCarePlan.fsh`
- Create: `input/fsh/profiles/MicroplanTask.fsh`
- Create: `input/fsh/profiles/MicroplanTargetPopulation.fsh`

- [ ] **Step 1:** Create targetLocationType extension on PlanDefinition.action
- [ ] **Step 2:** Create MicroplanLocation profile (partOf, type from VS, name required)
- [ ] **Step 3:** Create MicroplanPlanDefinition profile (actions with targetLocationType extension)
- [ ] **Step 4:** Create MicroplanCarePlan profile (basedOn PlanDefinition, subject Group, addresses Location)
- [ ] **Step 5:** Create MicroplanTask profile (basedOn CarePlan, focus ActivityDefinition, for Group, location required)
- [ ] **Step 6:** Create MicroplanTargetPopulation Group profile (type=person, actual=false, quantity required)
- [ ] **Step 7:** Run `sushi .` to validate
- [ ] **Step 8:** Commit

## Chunk 3: ActivityDefinitions, PlanDefinition Instance, and Examples

### Task 4: Create ActivityDefinitions

**Files:**
- Create: `input/fsh/activitydefinitions/PolioVaccinationSession.fsh`
- Create: `input/fsh/activitydefinitions/SupervisionVisit.fsh`
- Create: `input/fsh/activitydefinitions/CoverageMonitoring.fsh`

- [ ] **Step 1:** Create 3 ActivityDefinition instances
- [ ] **Step 2:** Commit

### Task 5: Create PlanDefinition instance

**Files:**
- Create: `input/fsh/plandefinitions/PolioSIACampaign.fsh`

- [ ] **Step 1:** Create Polio SIA Campaign PlanDefinition with 3 nested actions
- [ ] **Step 2:** Run `sushi .` to validate
- [ ] **Step 3:** Commit

### Task 6: Create example instances

**Files:**
- Create: `input/fsh/examples/` — Location hierarchy, CarePlan, Tasks, Groups

- [ ] **Step 1:** Create Location hierarchy examples (country → province → district → facility → 2 sites)
- [ ] **Step 2:** Create Group examples (target populations per site + aggregate)
- [ ] **Step 3:** Create CarePlan example
- [ ] **Step 4:** Create Task examples (vaccination, supervision, monitoring)
- [ ] **Step 5:** Run `sushi .` to validate
- [ ] **Step 6:** Commit

## Chunk 4: Page content

### Task 7: Create IG page content

**Files:**
- Create: `input/pagecontent/index.md`

- [ ] **Step 1:** Create index.md with IG overview
- [ ] **Step 2:** Commit and push to GitHub
