class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @sorted_numbers[0]

    @maximum = @sorted_numbers[@sorted_numbers.length-1]

    @range = (@maximum.to_f - @minimum.to_f)

    # Median
    # ======
    median = -1

    half_index = @numbers.length / 2

    if @numbers.length.odd?
      median = @sorted_numbers[@numbers.length / 2]
    else
      left = @sorted_numbers[half_index - 1].to_f
      right = @sorted_numbers[half_index].to_f
      median = (left + right) / 2.0
    end

    @median = median

    max = 0
    @numbers.each do |number|
      max += number
    end

    @sum = max

    max /= @numbers.length

    @mean = max

    # Variance
    # ========

    hold_variance = 0.0
    frequency = Hash.new
    max = 0
    times = 0
    @numbers.each do |number|
      new_count = frequency.fetch(number, 0) + 1
      frequency.store(number, new_count)

      if max < frequency.fetch(number)
        max = number
        times = frequency.fetch(number)
      end

      hold_variance += (number - @mean.to_f)**2
    end

    @variance = (hold_variance / @numbers.count).to_s
    
    @standard_deviation = (Math.sqrt(hold_variance / @numbers.count)).to_s

    # Mode
    # ====
    current_mode = 0
    max_frequency = 0
    @numbers.each do |number|
      if @numbers.count(number) > max_frequency
        current_mode = number
        max_frequency = @numbers.count(number)
      end
    end

    @mode = current_mode

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
