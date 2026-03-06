---
name: skogai-argc-docs2
description: Argc upstream documentation reference. Use when creating Argcfile.sh files, converting bash scripts to argc CLIs, adding argument parsing, shell completion, or task automation to projects.
---

# Command runner

Argc is a also command runner built for those who love the efficiency and flexibility of Bash scripting.

This guide provides instructions on how to effectively use `argc` for this purpose.

## Create an Argcfile.sh

Commands, called recipes, are stored in a file called argcfile .

Use `--argc-create` to quickly generate an `Argcfile.sh` for your project.

```sh
argc --argc-create build test
```

This creates a basic Argcfile.sh with sample `build` and `test` recipes.

```sh
#!/usr/bin/env bash

set -e

# @cmd
build() {
    echo TODO build
}

# @cmd
test() {
    echo TODO test
}

# See more details at https://github.com/sigoden/argc
eval "$(argc --argc-eval "$0" "$@")"
```

A recipe is a regular shell function with a `@cmd` comment tag above it.

## Handle dependencies

Since recipe are functions, manage dependencies by calling them sequentially within other functions.

```sh
# @cmd
current() { before;
  echo current
after; }

# @cmd
before() {
  echo before
}

# @cmd
after() { 
  echo after
}
```

This example demonstrates how the `current` recipe calls both `before` and `after` recipes.

```
$ argc current
before
current
after
```

## Organize Recipes

Organize related recipes into groups for better readability.

```sh
# @cmd
test() { :; }
# @cmd
test-unit() { :; }
# @cmd
test-bin() { :; }
```

> Valid group formats include: `foo:bar` `foo.bar` `foo@bar`.

## Set default recipe

When invoked without a specific recipe, Argc displays available recipes.

```
$ argc
USAGE: Argcfile.sh <COMMAND>

COMMANDS:
  build
  test

```

Use `main` function to set a default recipe to run automatically.

```sh
# @cmd
build() { :; }

# @cmd
test() { :; }

main() {
  build
}
```

Another way is to use `@meta default-subcommand`

```sh
# @cmd
# @meta default-subcommand
build() { :; }

# @cmd
test() { :; }
```

Remember, you can always use `--help` for detailed help information.

## Aliases

Aliases allow recipes to be invoked on the command line with alternative names:

```sh
# @cmd
# @alias t
test() {
  echo test
}
```

Now you can run the `test` recipe using the alias `t`:

```
argc t
```

## Access positional arguments

Accessed through shell positional variables (`$1`, `$2`, `$@`, `$*` etc.).

```sh
# @cmd
build() {
  echo $1 $2
  echo $@
  echo $*
}
```

```
$ argc build foo bar
foo bar
foo bar
```

## Access Flag/option arguments

Define and use flags/options for more control.

```sh
# @cmd  A simple command
# @flag -f --flag   A flag parameter
# @option -option   A option parameter
# @arg arg          A positional parameter
cmd() {
  echo "flag:    $argc_flag"
  echo "option:  $argc_option"
  echo "arg:     $argc_arg"
}
```

```
$ argc cmd -h
A simple command

USAGE: Argcfile.sh cmd [OPTIONS] [ARG]

ARGS:
  [ARG]  A positional parameter

OPTIONS:
  -f, --flag             A flag parameter
      --option <OPTION>  A option parameter
  -h, --help             Print help

$ argc cmd -f --option foo README.md
flag:    1
option:  foo
arg:     README.md
```

## Load environment variables from dotenv file

Use `@meta dotenv` to load environment variables from a `.env` file.

```sh
# @meta dotenv                                    # Load .env
# @meta dotenv .env.local                         # Load .env.local
```

## Document and Validate environment variables

Define environment variables using `@env`.

```sh
# @env  FOO               A env var
# @env  BAR!              A required env var
# @env  MODE[dev|prod]    A env var with possible values
```

Argc automatically generates help information for environment variables.

By running `argc -h`, you'll see a list of variables with descriptions and any restrictions.

```
$ argc -h
USAGE: Argcfiles.sh

ENVIRONMENTS:
  FOO   A env var
  BAR*  A required env var
  MODE  A env var with possible values [possible values: dev, prod]
```

Argc also validates environment variables as per the `@env` definitions.

If `$BAR` is missing, Argc will report an error:

```
error: the following required environments were not provided:
  BAR$MO
```

For `$MODE`, which has predefined values, Argc verifies the input values and reports errors if they do not match:

```
error: invalid value `abc` for environment variable `MODE`
  [possible values: dev, prod]
```

## Align the project's rootdir

Argc automatically cds into the directory of the Argcfile.sh it finds in the parent hierarchy.

Project directory structure as follows:

```
$ tree /tmp/project

/tmp/project
├── Argcfile.sh
└── src
```

The code of build recipe as follows:

```sh
# @cmd
build() {
    echo $PWD
    echo $ARGC_PWD
}
```

Run the build in the project dir:

```
$ argc build
/tmp/project
/tmp/project
```

Change directory (cd) into the subdirectory and run the build:

```
$ cd src && argc build
/tmp/project
/tmp/project/src
```

When running argc under the subdirectory other than project root,
`PWD` points to the project root, while `ARGC_PWD` points to the current directory.

# Specification

## Comment Tags

### `@describe`

Sets the description for the command.

> **<sup>Syntax</sup>**\
> `@describe` [_description_]

```sh
# @describe A demo CLI
```

### `@cmd`

Defines a subcommand.

> **<sup>Syntax</sup>**\
> `@cmd` [_description_]<sup>?</sup>

```sh
# @cmd Upload a file
upload() {
  echo Run upload
}

# @cmd Download a file
download() {
  echo Run download
}
```

```
USAGE: prog <COMMAND>

COMMANDS:
  upload    Upload a file
  download  Download a file
```

### `@alias`

Sets aliases for the subcommand.

> **<sup>Syntax</sup>**\
> [_name_] (`,` [_name_])<sup>\*</sup>

```sh
# @cmd Run tests
# @alias t,tst
test() {
  echo Run test
}
```

```
USAGE: prog <COMMAND>

COMMANDS:
  test  Run tests [aliases: t, tst]
```

### `@arg`

Defines a positional argument.

> **<sup>Syntax</sup>**\
> `@arg` [_name_] [_modifier_]<sup>?</sup> [_param-value_]<sup>?</sup>
> [_bind-env_]<sup>?</sup>
> [_notation_]<sup>?</sup>
> [_description_]<sup>?</sup>

```sh
# @arg va
# @arg vb!                        required
# @arg vc*                        multi-values
# @arg vd+                        multi-values + required
# @arg vna <PATH>                 value notation
# @arg vda=a                      default
# @arg vdb=`_default_fn`          default from fn
# @arg vca[a|b]                   choices
# @arg vcb[=a|b]                  choices + default
# @arg vcc*[a|b]                  multi-values + choice
# @arg vcd+[a|b]                  required + multi-values + choice
# @arg vfa[`_choice_fn`]          choice from fn
# @arg vfb[?`_choice_fn`]         choice from fn + no validation
# @arg vfc*[`_choice_fn`]         multi-values + choice from fn
# @arg vfd*,[`_choice_fn`]        multi-values + choice from fn + comma-separated list
# @arg vxa~                       capture all remaining args
# @arg vea $$                     bind-env
# @arg veb $BE <PATH>             bind-named-env
```

### `@option`

Defines an option argument.

> **<sup>Syntax</sup>**\
> `@option` [_short_]<sup>?</sup> [_long_] [_modifier_]<sup>?</sup> [_param-value_]<sup>?</sup>
> [_bind-env_]<sup>?</sup>
> [_notations_]<sup>?</sup>
> [_description_]<sup>?</sup>

```sh
# @option    --oa                   
# @option -b --ob                   short
# @option -c                        short only
# @option    --oc!                  required
# @option    --od*                  multi-occurs
# @option    --oe+                  required + multi-occurs
# @option    --of*,                 multi-occurs + comma-separated list
# @option    --ona <PATH>           value notation
# @option    --onb <FILE> <FILE>    two-args value notations
# @option    --onc <CMD> <FILE+>    unlimited-args value notations
# @option    --oda=a                default
# @option    --odb=`_default_fn`    default from fn
# @option    --oca[a|b]             choice
# @option    --ocb[=a|b]            choice + default
# @option    --occ*[a|b]            multi-occurs + choice
# @option    --ocd+[a|b]            required + multi-occurs + choice
# @option    --ofa[`_choice_fn`]    choice from fn
# @option    --ofb[?`_choice_fn`]   choice from fn + no validation
# @option    --ofc*[`_choice_fn`]   multi-occurs + choice from fn
# @option    --ofd*,[`_choice_fn`]  multi-occurs + choice from fn + comma-separated list
# @option    --oxa~                 capture all remaining args
# @option    --oea $$               bind-env
# @option    --oeb $BE <PATH>       bind-named-env
```

### `@flag`

Defines a flag argument. Flag is a special option that does not accept any value.

> **<sup>Syntax</sup>**\
> `@flag` [_short_]<sup>?</sup> [_long_]`*`<sup>?</sup>
> [_bind-env_]<sup>?</sup>
> [_description_]<sup>?</sup>

```sh
# @flag     --fa 
# @flag  -b --fb         short
# @flag  -c              short only
# @flag     --fd*        multi-occurs
# @flag     --ea $$      bind-env
# @flag     --eb $BE     bind-named-env
```

### `@env`

Defines an environment variable.

> **<sup>Syntax</sup>**\
> `@arg` [_NAME_]`!`<sup>?</sup>[_param-value_]<sup>?</sup>
> [_notation_]<sup>?</sup>
> [_description_]<sup>?</sup>

```sh
# @env EA                 optional
# @env EB!                required
# @env EC=true            default
# @env EDA[dev|prod]      choices
# @env EDB[=dev|prod]     choices + default
```

### `@meta`

Adds metadata.

> **<sup>Syntax</sup>**\
> `@meta` [_name_] [_value_]<sup>?</sup>

| syntax                           | scope  | description                                                          |
| :------------------------------- | ------ | :------------------------------------------------------------------- |
| `@meta version <value>`          | any    | Set the version for the command.                                     |
| `@meta dotenv [<path>]`          | root   | Load a dotenv file from a custom path, if persent.                   |
| `@meta default-subcommand`       | subcmd | Set the current subcommand as the default.                           |
| `@meta require-tools <tool>,...` | any    | Require certain tools to be available on the system.                 |
| `@meta man-section <1-8>`        | root   | Override the section for the man page, defaulting to 1.              |
| `@meta inherit-flag-options`     | root   | Subcommands will inherit the flags/options from their parent.        |
| `@meta combine-shorts`           | root   | Short flags/options can be combined, e.g. `prog -xf => prog -x -f`. |
| `@meta symbol <param>`           | any    | Define a symbolic parameter, e.g. `+toolchain`, `@argument-file`.    |

```sh
# @meta version 1.0.0
# @meta dotenv
# @meta dotenv .env.local
# @meta require-tools git,yq
# @meta man-section 8
# @meta symbol +toolchain[`_choice_fn`]
```

## Syntax parts

### short

 A single character abbreviation for a flag/option.

> **<sup>Syntax</sup>**\
> &nbsp;&nbsp; -[_short-char_] \
> | +[_short-char_]

### long

A descriptive name for a flag/option.

> **<sup>Syntax</sup>**\
> &nbsp; -- [_long-name_] \
> | -[_long-name_] \
> | +[_long-name_]

### modifier

Symbols used to modify param behavior:

> **<sup>Syntax</sup>**\
> &nbsp; `!` \
> | `*` [_separated-char_]<sup>?</sup> \
> | `+` [_separated-char_]<sup>?</sup>

- `!`: The option is required and must be provided.
- `*`: multi-occurs for @option; multi-values for @arg;
- `+`: The option is required and can be used multiple times.

### param-value

Ways to specify values for params:

> **<sup>Syntax</sup>**\
> &nbsp; =[_value_] \
> | =\`[_fn-name_]\` \
> | [[_choices_]] \
> | [=[_choices_]] \
> | [\`[_fn-name_]\`] \
> | [?\`[_fn-name_]\`]

### choices

Define a set of acceptable values for an param

> **<sup>Syntax</sup>**\
> [_value_] (`|` [_value_])<sup>\*</sup>

### notations

Placeholders in help messages and usage instructions:

> **<sup>Syntax</sup>**\
> ([_notation_] )<sup>\*</sup>  [_notation-last_]

### notation

> **<sup>Syntax</sup>**\
> `<` [_value_]`>`

- `FILE`/`PATH`: complete files
- `DIR`: complete directories

### notation-last

> **<sup>Syntax</sup>**\
> `<` [_value_] [_notation-modifier_]<sup>?</sup> `>`

### notation-modifier

Symbols used within the last notation to specify value requirements

> **<sup>Syntax</sup>**\
> &nbsp; `*` \
> | `+` \
> | `?`

- `*`: Zero or more values are allowed.
- `+`: One or more values are allowed.
- `?`: Zero or one value is allowed.

### short-char

A-Z a-z 0-9 `!` `#` `$` `%` `*` `+` `,` `.` `/` `:` `=` `?` `@` `[` `]` `^` `_` `{` `}` `~`

### separated-char

`,` `:` `@` `|` `/`

### bind-env

 Link environment variables to params:

- `$$`: Automatically use the param's name for the environment variable.
- `$`[_NAME_]: Use a specific environment variable name.

### description

Plain text for documentation and usage information

```sh
# @describe Can be multiline 
#
# Extra lines after the comment tag accepts description, which don't start with an `@`,
# are treated as the long description. A line which is not a comment ends the block.
```

[_short_]: #short
[_long_]: #long
[_modifier_]: #modifier
[_param-value_]: #param-value
[_choices_]: #choices
[_notations_]: #notations
[_notation_]: #notation
[_notation-last_]: #notation-last
[_notation-modifier_]: #notation-modifier
[_short-char_]: #short-char
[_separated-char_]: #separated-char
[_bind-env_]: #bind-env
[_description_]: #description
[_name_]: #name
[_long-name_]: #name
[_fn-name_]: #fn-name
[_value_]: #value
[_NAME_]: #name# Variables

Argc streamlines argument parsing in your shell scripts, allowing you to utilize variables seamlessly.

## Shell Variables

You can employ shell variables within your argc-based scripts just like you normally would in Bash. Argc doesn't interfere with their behavior.

```sh
# @cmd
cmd() {
  echo $1 $2  # Accessing positional arguments
  echo "$*"   # All arguments as a single string
  echo "$@"   # All arguments as separate strings
}
```

## Argc-Generated Variables

Argc automatically creates variables corresponding to the options, flags, and positional arguments defined in your script using the `@option`, `@flag`, and `@arg` directives.

```sh
# @option --oa
# @option --ob*  # Multiple values allowed
# @flag   --fa
# @arg va
# @arg vb*

eval "$(argc --argc-eval "$0" "$@")"  # Initializes Argc variables

echo '--oa:' $argc_oa
echo '--ob:' ${argc_ob[@]}  # Accessing multiple values as an array
echo '--fa:' $argc_fa
echo '  va:' $argc_va
echo '  vb:' ${argc_vb[@]}
```

Running `./script.sh --oa a --ob=b1 --ob=b2 --fa foo bar baz` would output:

```
--oa: a
--ob: b1 b2
--fa: 1
  va: foo
  vb: bar baz
```

## Built-in Variables

Argc also provides built-in variables that offer information about the parsing process:

- **`argc__args`**: An array holding all command-line arguments.
- **`argc__positionals`**: An array containing only the positional arguments.
- **`argc__fn`**: The name of the function that will be executed.

**Additional Variables for Completion (Used internally by Argc-Completions):**

- **`argc__cmd_arg_index`**: Index of the command argument within `argc__args`.
- **`argc__cmd_fn`**: Name of the command function.
- **`argc__dash`**: Index of the first em-dash (`--`) within the positional arguments.
- **`argc__option`**: Variable name of the option currently being completed.

These variables are particularly useful when creating custom completion scripts.

## Environment Variables

Several environment variables allow you to tailor Argc's behavior:

**User-Defined:**

- **`ARGC_SHELL_PATH`**: Specifies the path to the shell/bash executable used by Argc.
- **`ARGC_SCRIPT_NAME`**: Overrides the default script filename (Argcfile.sh).
- **`ARGC_COMPGEN_DESCRIPTION`**: Disables descriptions for completion candidates if set to 0 or false.
- **`ARGC_COMPGEN_DESCRIPTION_MAX_WIDTH`**: Maximum width for completion descriptions; excess will be truncated with an ellipsis.
- **`ARGC_COMPLETIONS_PATH`**: Defines the search path for Argc-based completion scripts.

**Argc-Injected:**

- **`ARGC_PWD`**: Current working directory (available only in Argcfile.sh).

**Argc-Injected (for completion):**
- **`ARGC_OS`**: Operating system type.
- **`ARGC_COMPGEN`**: Indicates whether the script is being used for generating completion candidates (1) or not (0).
- **`ARGC_CWORD`**: The last word in the processed command line.

It's important to distinguish between these two variables:

- **`ARGC_CWORD`**: This variable isolates the final word, regardless of any preceding flags or options. For example, in the command `git --git-dir=git`, `ARGC_CWORD` would be `git`.
- **`ARGC_LAST_ARG`**: This variable captures the entire last argument, including any flags or options attached to it. In the same example, `ARGC_LAST_ARG` would be `--git-dir=git`.

Understanding these variables is key to effectively leveraging Argc's capabilities and creating robust and user-friendly command-line interfaces.
