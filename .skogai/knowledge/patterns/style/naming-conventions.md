# naming conventions

<purpose>

consistent naming patterns for files, commands, tags, and variables.

</purpose>

<content>

| type            | convention          | example                          |
| --------------- | ------------------- | -------------------------------- |
| files           | kebab-case          | `execute-phase.md`               |
| commands        | `skogai:kebab-case` | `skogai:execute-phase`           |
| xml tags        | kebab-case          | `<execution_context>`            |
| step names      | snake_case          | `name="load_project_state"`      |
| bash variables  | caps_underscores    | `phase_arg`, `plan_start_time`   |
| type attributes | colon separator     | `type="checkpoint:human-verify"` |

</content>
