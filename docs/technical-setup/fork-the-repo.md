# Fork the repository

You will need to create a [_fork_](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#about-forks) of the [`OpenScPCA-analysis`](https://github.com/AlexsLemonade/OpenScPCA-analysis/) repository.

A fork is a copy of an _upstream_ repository (here, `AlexsLemonade/OpenScPCA-analysis` is the _upstream_) that you will own and will be in your GitHub account.
As a contributor, you will perform analyses in your fork.
Just like the upstream `AlexsLemonade/OpenScPCA-analysis` repository, your fork will also be a public repository.

!!! info "Your fork will be public and openly licensed."
	Code and other materials you commit to your fork and push to GitHub will be **publicly available** and licensed under the same license as the `AlexsLemonade` repository (Creative Commons Attribution 4.0 International and 3-Clause BSD licenses).


	Be careful about what you commit!
    See our [Policies](../policies/index.md) page for more information.

One benefit of using a fork is that changes you make will not affect the upstream project in `AlexsLemonade/OpenScPCA-analysis`.
This means you can safely work on your analyses without worrying about messing anything up in the upstream repository.
Periodically, you will request to add your analysis code to the upstream repository through a [_pull request_](../contributing-to-analyses/creating-pull-requests/index.md) process.

## Create your fork

Follow these steps to create your fork:

1. In your browser, navigate to the `OpenScPCA-analysis` repository: [https://github.com/AlexsLemonade/OpenScPCA-analysis/](https://github.com/AlexsLemonade/OpenScPCA-analysis/).


1. At the top right corner, click the "Fork" button:
(The numbers you see in this screenshot may differ from the numbers on the website – that's expected.)
    <!-- keep this tabbed in to enable numbered list -->
    <figure markdown="span">
        ![Button on GitHub to fork a repository.](../img/fork-button.png){width="400"}
    </figure>


1. On the next screen, GitHub will prompt you for some settings about your fork.
Make sure that these conditions are met, and then click the "Create fork" button on the bottom right.
    - Although the screenshot below shows an "Owner" username of `sjspielman`, you should see your username in this field
    - Keep the default Repository name as `OpenScPCA-analysis`
    - The box "Copy the `main` branch only" is checked
    - You can add a description if you want, but it is not necessary
    <figure markdown="span">
        ![Screen to set up new fork.](../img/create-fork.png){width="600"}
    </figure>


That's it! 🎉
In a few moments, GitHub will redirect to your newly forked repository at `https://github.com/YOUR_USERNAME/OpenScPCA-analysis`, and you're ready to proceed to the next step of [cloning your repository](./clone-the-repo.md).
