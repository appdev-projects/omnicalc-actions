class TimeBetweenController < ApplicationController
  def time_between
    @starting = Time.parse(params.fetch("starting_time"))
    @ending = Time.parse(params.fetch("ending_time"))

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    difference = @ending - @starting
    @seconds = difference
    @minutes = (difference / 60)
    @hours = (difference / 3600)
    @days = ((difference / 3600) / 24)
    @weeks = ((difference / 3600) / 24) / 7
    @years = (((difference / 3600) / 24) / 365)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between_templates/time_between.html.erb")
  end

  def time_between_form
    render("time_between_templates/time_between_form.html.erb")
  end
end
