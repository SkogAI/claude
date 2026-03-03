# anti-patterns to avoid

<purpose>

patterns that are explicitly banned in skogai documentation.

</purpose>

<content>

## enterprise patterns (banned)

- story points, sprint ceremonies, raci matrices
- human dev time estimates (days/weeks)
- team coordination, knowledge transfer docs
- change management processes

## temporal language (banned in implementation docs)

**don't:** "we changed x to y", "previously", "no longer", "instead of"

**do:** describe current state only

**exception:** changelog.md, migration.md, git commits

## generic xml (banned)

**don't:** `<section>`, `<item>`, `<content>`

**do:** semantic purpose tags: `<objective>`, `<verification>`, `<action>`

## vague tasks (banned)

```xml
<!-- bad -->
<task type="auto">
  <name>add authentication</name>
  <action>implement auth</action>
  <verify>???</verify>
</task>

<!-- good -->
<task type="auto">
  <name>create login endpoint with jwt</name>
  <files>src/app/api/auth/login/route.ts</files>
  <action>post endpoint accepting {email, password}. query user by email, compare password with bcrypt. on match, create jwt with jose library, set as httponly cookie. return 200. on mismatch, return 401.</action>
  <verify>curl -x post localhost:3000/api/auth/login returns 200 with set-cookie header</verify>
  <done>valid credentials -> 200 + cookie. invalid -> 401.</done>
</task>
```

</content>
