#!/bin/sh

#----Edit the values of lines 5-7 for your local usage----
REPO_NAME='Auto Commit and Push Test'
LOCAL_REPO_DIRECTORY=~/Desktop/acp-test/auto-commit-and-push-test
REMOTE_BRANCH_TO_PUSH_TO='master'
#---------------------------------------------------------
COMMIT_MESSAGE="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`

# Add modified file(s), commit and push to repo
cd ${LOCAL_REPO_DIRECTORY}
${GIT} add --all .
${GIT} commit -m "$COMMIT_MESSAGE"
GIT_PUSH_RESULT="$(${GIT} push -u origin ${REMOTE_BRANCH_TO_PUSH_TO})"
echo "$GIT_PUSH_RESULT"

# Display pop up notification on macOS to let you know it pushed to your repo
osascript -e 'display notification "Pushed to repo: '"$REPO_NAME"'" with title "acp"'