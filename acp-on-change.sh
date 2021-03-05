#!/bin/sh

#----Edit the values of lines 5-7 for your local usage----
# I recommend making the DIRECTORY_TO_MONITOR be a directory in your repo
REPO_NAME='Auto Commit and Push Test'
REPO_DIRECTORY=~/Desktop/acp-test/auto-commit-and-push-test
REMOTE_BRANCH_TO_PUSH_TO='master'
#---------------------------------------------------------

COMMIT_MESSAGE="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
cd ${REPO_DIRECTORY}
${GIT} add --all .
${GIT} commit -m "$COMMIT_MESSAGE"
echo "$(${GIT} push -u origin ${REMOTE_BRANCH_TO_PUSH_TO})"
osascript -e 'display notification "Pushed to repo: '"$REPO_NAME"'" with title "acp"'