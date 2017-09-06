# Assignment 1
Due:  11:59pm on Wednesday, September 13th.


# Overview

This assignment has several goals:

1.  Introduce you to writing your first Ruby program, including getting familiar with iterators, blocks, instance variables, classes, and methods.
2.  Get familiar with writing code in the Cloud9 IDE.
3.  Gain experience in using github as a source code repository.
4.  Use Rubocop to apply standardization rules.


# What you need to do to complete this assignment:

1.  Create an account on Cloud9.  I suggest you make the account name the same as your Github account name.
2.  Create an account on Github.
3.  Accept the assignment url when it's sent to you.
4.  Clone your repository into your Cloud9 environment.  (git clone)
5.  Create a branch in your local repository.  (git branch <name>)
6.  Change to that branch to do your work.  (git checkout <name>)
7.  Do whatever is necessary to ensure that all the tests in game_helper_test.rb pass.  (Note that the grader bot will also test your code against some tests that you don't have.)  (cd code;  ruby game_helper_test.rb)
8.  Do whatever is necessary to ensure all Rubocop tests pass.  (cd code;  rubocop .)
9.  Commit your work to the local repository.  (git add ., git commit -m <message>)
10.  Push your local repository to your Github repository.  (git push)
11. Execute a pull request on Github (i.e. via the browser client), which will trigger the grader bot to clone your repository, run all the tests against it, and return the results in your PR.  Only the most recent PR will be scored, so you can execute a PR as many times as you want (up to the turn-in deadline after which the grader bot will refuse to grade your repository).  What that means is that if you do the PR at 7pm
on the due date and then you release you forgot something, you can push another
batch of code and do another PR at, say, 11pm, and the grading bot will pay
attention to the 11pm PR and ignore the 7pm PR.  
12. To make this all work, we need to know how to map from your Github username
to your University ID.  There is a file in the root directory of the
assignment's repository called u-number.txt.  Enter your u-number in that file on line 2 (i.e. immediately after the comment line).  Be sure the changed version gets committed to your repo.

# Rubric

Task | Value
----------------------------------------------|------
You successfully accept the assignment link and your repository is created on Github under the class account.    | 10%
Your repository contains at least one non-master branch. | 10%
You execute a PR with the correct format to trigger the grader bot. | 10%
All the regular tests run to completion. | 25%
All the non-regular (i.e. those you don't get ahead of time) run to completion. | 5%
Your Ruby code passes all Rubocop tests. This includes both code files in the code directory.  | 20%
You register your Github username with your U-number with us.  | 20%


# Additional Details for Task 7 - Ruby Tests

Using the supplied code, your job is to add functionality so that the
tests in game_helper_test.rb are executed without exceptions and return the correct
results to satisfy the assertions.  There are generally two kinds of work you'll
need to do to get the tests to pass:  1) notice that there are chunks of code missing
in the game_helper.rb class.  Write the appropriate code for those missing chunks.
2) there are a few tests that you'll need to write...they currently only assert false.
Replace that line with code to drive the GameHelper class and verify the results
are correct.  

For those of you interested, we're using a Ruby gem (aka library) called minitest
to manage our test cases.  It's a nice, easy-to-understand gem that lets you write
pure ruby to test your code.  Once we get to Rails, we'll continue with minitest
even though the more standard gem for Rails test is rspec.  Rspec has its own
domain specific language so there's a bit a learning curve there.  If you were
going to become a Rails expert, you'd want to learn rspec.  


# Additional Details for Task 8 - Rubocop

Rubocop is a style checker that is common in the Ruby and Rails communities.  To
run it, cd into your code directory and run 'rubocop .' from the command line.
You may find Rubocop to be awfully persnickety, but following its rules will make
you an easier to work with as a team member.



# Misc Notes

An excellent article on how we'll be using Github.

http://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/
