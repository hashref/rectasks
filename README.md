# rectasks

This Perl script is used for exporting daily tasks, tracked in taskwarrior, to an Obsidian document. It is a highly specific use case that is mainly used for my specific daily workflow.

**NOTE:** Though it's "bad practice", I haven't pushed any of this to CPAN. I have no plans to push this out to CPAN at this point as it's such a specific use case. Feel free to use/modify/ignore as you see fit.

## Installation

Select the latest release `tar.gz` file by clicking the latest project release. Copy the URL for the `.tar.gz` file and paste it into a `cpanm` command.

**Example:**

```sh
cpanm https://github.com/hashref/rectasks/archive/refs/tags/v0.0.1.tar.gz
```

Or, if you are more familiar with Perl, you can clone this repo, run `perl Makefile.PL && make && make dist`. From there install the tarball that it creates with `cpanm`.

**Example:**

```sh
$ git clone https://github.com/hashref/rectasks.git
$ cd rectasks
$ perl Makefile.PL
$ make
$ make test
$ make dist
$ cpanm rectasks-0.01.tar.gz
```

## Prerequisites

[taskwarrior](https://taskwarrior.org/) has to be installed and has to be tracking tasks that are worked on daily. Otherwise, what's the point?

Additionally, it requires a `today` custom report that will output the tasks that were worked on during the day.

_copy and paste into your .tashrc :_

```conf
report.today.description=A simple report for that was worked on today
report.today.columns=status,description
report.today.sort=modified
report.today.filter=(status:pending and modified:today) or (status:completed and end:today)
```

Creating this custom report will provide the `task today` command, which will output a list of tasks performed during the day.

See the [taskwarrior documentation](https://taskwarrior.org/docs/report/) for more details on custom reports.

## Running

Each day, the command is run and it will open the daily document (i.e. `YYYY-MM-DD.md`), search for a token, `{TASK_LIST}`, and inserts a bulleted list of tasks that were performed that day.

_Example :_

Running the command...

```
rectasks <OBSIDIAN_DAILY_JOURNAL_PATH>
```

Will update the Obsidian document...

```md
...

# DAILY TASKS

{TASK_LIST}

...
```

Inserting the tasks...

```md
...

# DAILY TASKS

- Task #1
- Task #2
- Task #3
  ...
- Task #N

...
```
