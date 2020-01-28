# Omnicalc Actions

## Introduction

The goal of this project is to get more practice with writing Ruby programs. You will execute the code simply by visiting a particular URL in your browser. **Your visit will trigger the execution of the Ruby code, and the output will appear in your browser window.**

## Target

Ultimately, you will build this application:

http://omnicalc-actions.herokuapp.com/

It is a collection of calculators that do various things; count the number of words in a block of text, the monthly payment for a loan, etc. Over time, we may add more and more calculators if we feel like it (if you have a suggestion for a calculator you think we should add, please let us know).

### Setup

## Standard Workflow

 1. Set up the project: `bin/setup`
 1. Start the web server by clicking "Run Project".
 1. Navigate to your live application preview.
 1. Type in some text and submit the form.
 1. On the results page, you will currently see just a bunch of placeholders. Your job will be to replace the placeholders with correctly computed values.
 1. In Cloud9, find the `/app/controllers/word_count_controller.rb` file.
 1. Locate the part of the file that looks like this:

    ```ruby
    def word_count
      @text = params[:user_text]
      @special_word = params[:user_word]

      # ================================================================================
      # Your code goes below.
      # The text the user input is in the string @text.
      # The special word the user input is in the string @special_word.
      # ================================================================================


      @character_count_with_spaces = "Replace this string with your answer."

      @character_count_without_spaces = "Replace this string with your answer."

      @word_count = "Replace this string with your answer."

      @occurrences = "Replace this string with your answer."
    end
    ```

 1. The code between the `def word_count` and `end` is the program that gets executed. I have already written some code that retrieves the inputs from the form and places them into variables for you to use, `@text` and `@special_word`.
 1. Your job is to write code below the comments and, ultimately, store the correct values in the variables I created at the bottom of the method. For example, to solve the first part, call `.length` on the user's input, `@text`, and assign the result to `@character_count_with_spaces`.

    ```ruby
    @character_count_with_spaces = @text.length
    ```

 1. You have to figure out how to calculate the correct value for the rest: `@character_count_without_spaces`, `@word_count`, and `@occurrences`. Don't change the names of these variables; if you do, your results won't appear in the browser in the end.
 1. Refresh the results page in your browser to re-run your code and see new output.
 1. You can write as much or as little code as it takes to produce the correct answer; create intermediate variables if you want, or do anything else that you learned about from class. It's all just the same Ruby as before.
 1. Keep working; your goal is to make your application behave exactly like the target. Next, work on the [Loan Payment calculator](http://localhost:3000/loan_payment/new). You'll again be working in the same file, `/app/controllers/calculations_controller.rb`. This time, scroll down to the method `def loan_payment` and write your code in there as indicated by the comments. You can find the formula at the end of the "Monthly payment formula" section of [this article](https://en.wikipedia.org/wiki/Mortgage_calculator#Monthly_payment_formula).
 1. Some tasks are easier, some are much harder. For example, in the Descriptive Statistics calculator, finding the mode (the number that occurs most frequently in a list of numbers) is surprisingly hard. Do your best, but don't get discouraged if you can't quite solve it without asking questions.
 1. Ask lots of questions!
 1. As you work, remember to navigate to `/git` and **commit often as you work.**
 1. Make new branches freely to experiment! _Especially_ before starting on a new task.
 1. Run `rails grade` as often as you like to see how you are doing, but **make sure you test your app manually first to make sure it matches the target's behavior first**.

