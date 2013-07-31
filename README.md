# Git Workflow

This repository is intended to document a useful workflow for git, as well as to provide something to practice on when getting used to the proposed workflow.

## Overview

This is a basic overview; more detail on each of the points is given below.

* At the start of a project, create a release branch
* Pick up a ticket for a feature
* Pull the most recent changes from the release branch
* Run specs to check they are green
* Create a feature branch for the ticket
* Implement the feature, making many small commits
* Rebase your commits on top of master, squashing your commits into sensible higher level ones
* Create a pull request for code review
* Get the pull request code reviewed and merged
* Delete both the local and remote versions of your feature branch
* Repeat until all features for the release are completed
* Release
* Merge your release branch back into master
* Delete both the local and remote versions of your release branch

### At the start of a project, create a release branch

This should be prepended with `release/` and be lower-case words joined with hyphens.

For example, `release/phase-two`.

### Pick up a ticket for a feature

Not much needs to be said for this. Claim a ticket on the kanban board.
For the sake of example let's say it's called "Smoking Cost Calculator".

### Pull the most recent changes from master

    git fetch && git pull

### Run specs to check they are green

Just to make sure.

### Create a feature branch for the ticket

This should be prepended with `feature/` and be lower-case words joined with hyphens.

    git co -b feature/smoking-cost-calculator

If more than one person is working on a feature you may want to consider having personal branches taken from the feature branch (eg. `russell/smoking-cost-calculator-red-button`)

### Implement the feature, making many small commits

It doesn't matter if your commits are two low level but you should avoid doing more than "one thing" in a commit. It's easy to squash commits, pulling them apart is a bit trickier.

### Rebase your commits on top of master, squashing your commits into sensible higher level ones

    git rebase master -i

This will open your default editor which will allow you to squash/rename commits.
You should aim for sensible, high-level commits here with useful messages.
It's also nice to add a github emoji to sum up the emotional content of the commit :smile:

You can do this repeatedly if several releases go by while you're writing your feature - obviously this is not ideal.

This avoids the git history being cluttered up with meaningless merge commits that just create noise and confusion.

### Create a pull request into the release branch for code review

If you're using hub, this can be done with `git pull-request` - otherwise in github.

### Get the pull request code-reviewed and merged

This needs to be done by someone else on the team.

The merge should be done using the `--no-ff` flag to ensure there is a merge commit.
This marks the point at which the feature was merged into the release:

    git checkout release/phase-two
    git merge feature/smoking-cost-calculator --no-ff

### Delete both the local and remote versions of your feature branch

    git branch -d feature/smoking-cost-calculator
    git push :feature/smoking-cost-calculator

### Repeat until all features for the release are completed

### Release

Release the release branch

### Merge your release branch back into master

    git checkout master
    git merge release/phase-2 --no-ff

Again, use the `no-ff` flag to ensure there is a merge commit.

### Delete both the local and remote versions of your release branch

    git branch -d release/phase-two
    git push :release/phase-two

