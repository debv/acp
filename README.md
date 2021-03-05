# acp

Automatically add, commit and push to your remote repository when a change is made in your local repository.

Intended for use on macOS for now.

---

## Pre-requisites

1. Install [homebrew](https://brew.sh) if you don't already have it
2. Install [fswatch](https://github.com/emcrisostomo/fswatch) by running the following command in your terminal
   ```
   brew install fswatch
   ```
   fswatch is needed since it is what will monitor file changes for us.

## Set Up for Local Use

1. Download the `acp-on-change.sh` script from this repository and save it wherever you plan to execute fswatch from on your local machine.

2. If it isn't on your local already, clone your target repository. You can find the https url for cloning in the github page for your repository under the green "Code" dropdown button where it says 'https'. Once you have this url, you can clone by running the following command in the terminal from the directory you want your local repo to be in:

   ```
   git clone your_repo_https_url.git
   ```

3. Open the script you just saved in any text editor, edit lines 5-7 and save the file changes. These edits will configure the script to your local machine and git repo.

## Usage

To run the process, navigate to the directory where your `acp-on-change.sh` file is and run the following command, replacing DIRECTORY_TO_MONITOR with the path to the directory you want to monitor:

```
fswatch -0 DIRECTORY_TO_MONITOR | xargs -0 -n 1 sh "./acp-on-change.sh"
```

For example, this is the path I use for the directory I monitor on my computer:

    ~/Desktop/acp-test/auto-commit-and-push-test/md-files/

When you execute the fswatch command above, it will start up fswatch to monitor the directory you specified.

While this process is running, every change you make within the monitored directory will trigger the `acp-on-change.sh` script to automatically add, commit and push the change to your remote git repository.

If you want to change the frequency of changes that triggers the script, change the '-n 1' parameter in the fswatch command above to whatever number you want.

(e.g. if you change '-n 1' to '-n 3' it will only trigger the script on every 3rd change that happens in the specified directory)

To terminate the process, press `ctrl`+`c` in the terminal window that is running it.
