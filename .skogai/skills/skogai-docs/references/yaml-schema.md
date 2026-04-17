---
title: yaml-schema
type: note
permalink: skogai/skills/skogai-docs/references/yaml-schema
---

# YAML Frontmatter Schema

**See `skills/skogai-docs/schema.yaml` for the complete schema specification.**

## Required Fields

- **module** (string): Module name (e.g., "EmailProcessing", "UserService") or project-wide scope
- **date** (string): ISO 8601 date (YYYY-MM-DD)
- **problem_type** (enum): One of [build_error, test_failure, runtime_error, performance_issue, database_issue, security_issue, ui_bug, integration_issue, logic_error, developer_experience, workflow_issue, best_practice, documentation_gap]
- **component** (enum): One of [api, database, authentication, frontend, backend, config, integration, testing, deployment, infrastructure, middleware, cli, documentation, other]
- **symptoms** (array): 1-5 specific observable symptoms
- **root_cause** (enum): One of [missing_association, missing_include, missing_index, wrong_api, scope_issue, thread_violation, async_timing, memory_leak, config_error, logic_error, test_isolation, missing_validation, missing_permission, missing_workflow_step, inadequate_documentation, missing_tooling, incomplete_setup]
- **resolution_type** (enum): One of [code_fix, migration, config_change, test_fix, dependency_update, environment_setup, workflow_improvement, documentation_update, tooling_addition, seed_data_update]
- **severity** (enum): One of [critical, high, medium, low]

## Optional Fields

- **framework_version** (string): Framework version in X.Y.Z or X.Y format
- **tags** (array): Searchable keywords (lowercase, hyphen-separated)

## Validation Rules

1. All required fields must be present
1. Enum fields must match allowed values exactly (case-sensitive)
1. symptoms must be YAML array with 1-5 items
1. date must match YYYY-MM-DD format
1. framework_version (if provided) must match X.Y.Z or X.Y format
1. tags should be lowercase, hyphen-separated

## Example

```yaml
---
module: Email Processing
date: 2025-11-12
problem_type: performance_issue
component: database
symptoms:
  - "N+1 query when loading associated records"
  - "Listing page taking >5 seconds"
root_cause: missing_include
framework_version: 7.1.2
resolution_type: code_fix
severity: high
tags: [n-plus-one, eager-loading, performance]
---
```

## Category Mapping

Based on `problem_type`, documentation is filed in:

- **build_error** -> `docs/solutions/build-errors/`
- **test_failure** -> `docs/solutions/test-failures/`
- **runtime_error** -> `docs/solutions/runtime-errors/`
- **performance_issue** -> `docs/solutions/performance-issues/`
- **database_issue** -> `docs/solutions/database-issues/`
- **security_issue** -> `docs/solutions/security-issues/`
- **ui_bug** -> `docs/solutions/ui-bugs/`
- **integration_issue** -> `docs/solutions/integration-issues/`
- **logic_error** -> `docs/solutions/logic-errors/`
- **developer_experience** -> `docs/solutions/developer-experience/`
- **workflow_issue** -> `docs/solutions/workflow-issues/`
- **best_practice** -> `docs/solutions/best-practices/`
- **documentation_gap** -> `docs/solutions/documentation-gaps/`
