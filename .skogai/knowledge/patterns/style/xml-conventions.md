# xml tag conventions

<purpose>

semantic xml container patterns, task/checkpoint structure, and conditional logic.

</purpose>

<content>

## semantic containers only

xml tags serve semantic purposes. use markdown headers for hierarchy within.

**do:**

```xml
<objective>
## primary goal
build authentication system

## success criteria
- users can log in
- sessions persist
</objective>
```

**don't:**

```xml
<section name="objective">
  <subsection name="primary-goal">
    <content>build authentication system</content>
  </subsection>
</section>
```

## task structure

```xml
<task type="auto">
  <name>task n: action-oriented name</name>
  <files>src/path/file.ts, src/other/file.ts</files>
  <action>what to do, what to avoid and why</action>
  <verify>command or check to prove completion</verify>
  <done>measurable acceptance criteria</done>
</task>
```

**task types:**

- `type="auto"` - claude executes autonomously
- `type="checkpoint:human-verify"` - user must verify
- `type="checkpoint:decision"` - user must choose

## checkpoint structure

```xml
<task type="checkpoint:human-verify" gate="blocking">
  <what-built>description of what was built</what-built>
  <how-to-verify>numbered steps for user</how-to-verify>
  <resume-signal>text telling user how to continue</resume-signal>
</task>

<task type="checkpoint:decision" gate="blocking">
  <decision>what needs deciding</decision>
  <context>why this matters</context>
  <options>
    <option id="identifier">
      <name>option name</name>
      <pros>benefits</pros>
      <cons>tradeoffs</cons>
    </option>
  </options>
  <resume-signal>selection instruction</resume-signal>
</task>
```

## conditional logic

```xml
<if mode="yolo">
  content for yolo mode
</if>

<if mode="interactive" or="custom with gates.execute_next_plan true">
  content for multiple conditions
</if>
```

</content>
