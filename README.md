# Rewrite every Git commit email in your Github account

Did you know anyone can view your Git commit email, just by adding `.patch` to the end of a public Github commit URL? [Try it!](https://github.com/torvalds/linux/commit/eb26cbb1a754ccde5d4d74527dad5ba051808fad.patch)

This repo allows you to specify a list of repos you'd like to have their Git commit author details rewritten. Say, for example, you've used your personal email address for all Git commits in the past and now you want to hide them all.

It uses uses [git filter-repo](https://github.com/newren/git-filter-repo/#solving-this-with-filter-repo) under the hood to perform rewrites.

## Prerequisites

Install [git filter-repo](https://github.com/newren/git-filter-repo/#solving-this-with-filter-repo) on your machine.

## Instructions

1. Create a list of repo names

    An easy way to get all your repo names is to navigate to your personal Github repositories page (i.e. `github.com/<username>?tab=repositories`), and run the following script in the browser console:

    ```js
    let store = ""
    document.querySelectorAll('#user-repositories-list > ul > li > div > div > h3 > a').forEach(a => {store += (a.innerText + "\n")})
    console.log(store)
    ```

    The good thing is you can use Github's filter on the page to select specific repositories (e.g. only Public repos)

2. Save the list into `repos.txt`, without newline at the end
3. Add your username to `clone.sh` and `run.sh`, in the `username` Bash variable
4. In the `mailmap` file, input the list of emails you'd like to rewrite
4. Clone your repos using `chmod +x clone.sh && ./clone.sh`
5. Perform the rewrite using `chmod +x run.sh && ./run.sh`

---

That's it! It shouldn't take more than 20 minutes for the whole process.
