# Git Workflow

This repository is intended to document a useful workflow for git.

It intentionally leaves out the details of creating and maintaining release
branches, tagging and deploying code so as to keep it simple for those more
unfamiliar with git. The focus here is on your daily workflow of writing features.

## Prerequisites - IMPORTANT!

You must have the config value for `push.default` set to `upstream`.
You can do this by running the following command:

    git config --global push.default upstream

## Overview

This is a basic overview; more detail on each of the points is given below.

1. Pick up a ticket from the Kanban board
2. Pull the latest changes from the current release branch
3. Check out a new feature branch from the release branch
4. Write code, commit, repeat
5. Rebase the release branch into your feature branch
6. Create a pull request into the release branch
7. Have a colleague code review the feature and merge

#### 1. Pick up a ticket from the Kanban board
This one is self-explanatory.
#### 2. Pull the latest changes from the current release branch
Make sure you are up to date:

    git checkout release/name-of-release
    git pull

#### 3. Check out a new feature branch from the release branch

Run the following with the release branch checked out:

    git checkout -b feature/name-of-feature

#### 4. Write code, commit, repeat

These commits should be small and atomic - eg. "New question for smoking cost calculator". Do this until you've finished writing the feature.

#### 5. Rebase the release branch into your feature branch

This pulls any changes that have been made to the release branch into your feature branch and applies your changes on top of them. It also gives you a chance to clean up your commit history.

Run the following with your feature branch checked out:

    git rebase release/name-of-release -i

This will open up your default editor (specified by the `GIT_EDITOR` environment variable) with a screen that will allow you to rename, reorder, and squash your commits.

You should squash any small commits into cohesive, higher level commits with descriptive messages. It also makes github look nicer and helps remind you to stop and think about your commit message if you start each one with an emoji to sum up the "emotional content" of the commit. See the [Emoji Cheatsheet](http://www.emoji-cheat-sheet.com).

The aim is for commits to tell a helpful story of the history of the project - and the trick is to get the messages at the right level of detail.

#### 6. Create a pull request into the release branch

Make sure you have pushed your changes to remote (the first time you do this you will need to set upstream like this: `git push -u origin feature/name-of-feature`).

If you are using Hub (`brew install hub` on a mac) you can create a pull request by running the following command with your feature branch checked out:

    git pull-request release/name-of-release

Otherwise you can create the pull request in github.

#### 7. Have a colleague code review the feature and merge

Assign the pull request you have created to a colleague so they can review your code and suggest any changes. Make any changes they suggest! When you are both happy they can merge your feature into the release branch by checking out the release branch and running this command:

    git merge feature/name-of-feature --no-ff

This will create a merge commit, which is helpful in that it records both when the
feature was merged into the release branch and who did the code review.

Now pick up your next ticket!

## Glossary

#### Release Branch
This has the newest, unreleased, but stable code. It should be releasable at any time. No-one should commit directly to it. It should be named something like this: `release/name-of-release`.

#### Feature Branch
A temporary branch that is used by a single developer while implementing a feature. It should be named something like this: `feature/name-of-feature`.



