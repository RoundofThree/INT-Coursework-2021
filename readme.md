# Introduction to AI Coursework 2021

Welcome to the Introduction to Artificial Intelligence coursework repo 2021. This repo, and it's associated documentation (such as this readme) is provided as a convenient way to allow you to run your PDDL domain on a planner, either locally or remotely. 

**Please note, this readme is not a substitute for the main document outlining the expectations and deliverables for the coursework. It should be viewed as additional help _only_**

The purpose of this repo is to allow you to write PDDL domains and problems, push them to GitHub and have GitHub Actions (a CI/CD service) automatically execute them for you and provide you with a repo of their success or failure. By using GitHub, not only do you make it easy to test your domains, you make it easy for your team to collaborate on the writing and development of them.

## Getting Started

**Read these instructions carefully, failure to follow correctly could result in academic misconduct and failure of the coursework**

To get started, you will first need to make a copy of this repo onto your own account.

Only **one person per team** should do this and everyone else should be added to that repo.

1. Navigate to the [template repository](https://github.com/nergmada/INT-Coursework-2021)

2. In the left corner, click the green button that reads "Use this template".
![use_template](https://i.ibb.co/85r44HR/Screenshot-from-2021-02-09-12-41-22.png)

3. On the "create new repo" page, use the same repo name as the coursework "INT-Coursework-2021". Please make sure that you copy this title exactly!

    Additionally, **you must** set your repo to private. Failure to do so could result in plagiarism issues which may affect your marks.

    ![configure_repo](https://i.ibb.co/kydf23C/image.png)

4. Because your new repo is private, you will need to add the rest of your team members. You can do this with their email or GitHub username by going to `Settings > Manage Access > Invite a Collaborator`
    
    You must also add myself, _nergmada_ to your repo. This allows us to provide quicker technical support and to collect your PDDL submissions.

5. You must change the file called `TEAM` to your team number as can be found on the Team Feedback page for your group. Again, failure to do so could result in you not receiving as many marks as you may otherwise!

6. Finally your repo is now setup, you can clone it and start writing PDDL. In the `src` file of the repo, you will find `domain.pddl` and `problem_1.pddl` and `problem_2.pddl`. These are here as placeholders, you can safely replace these with your own domain and problem files.


## Using this repo

This repo will automatically run every (correctly labelled) problem against the domain file in the `src` folder of this repo.

When you write your domain, you should write it in the the `domain.pddl` file found in source. All your problem files should be written in files labelled `problem_X.pddl` where `X` is the number of the problem file. 

_Note: This repo only runs problem files sequentially starting at 1 and will terminate when it cannot find the next number in the sequence_ 

You should label all your problem files starting at 1 like `problem_1.pddl`, `problem_2.pddl`, `problem_3.pddl`, ensuring there are no gaps.

When you push these to GitHub, GitHub actions will run them and post an issue to github with the results. You can view issues by going to the "Issues" tab on your repo.

## Running Locally (Optional Advanced)

To run this code locally (which is only recommended for advanced users) you will need experience with docker and docker installed.

1. Open a terminal in the repo folder

2. Open the `Dockerfile` and add the following lines above the final line which reads `ENTRYPOINT ./plan.sh`

```
COPY ./src /src
WORKDIR /src
```

**Do not commit the updated Dockerfile to github, or you WILL break github actions for your repo**

3. To run your domain and problem file, you must first run the `build.sh` script (for Mac/Linux) or `build.bat` script (for Windows)

4. You can now execute your domain on the build container (it takes up to 10 mins to build the container the first time), but running `run.sh` (for Mac/Linux) or `run.bat` (for Windows) 