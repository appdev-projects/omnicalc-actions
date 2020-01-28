class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    words = @text.gsub(/[^a-z0-9\s]/i, "").split
    count = 0
    words.each do |w|
      if w.downcase  == @special_word.downcase
        count += 1
      elsif w.downcase == @special_word.downcase
        count += 1
      end
    end
    @word_count = words.length

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.split.join.length

    @occurrences = count

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render( { :template => "word_count_templates/word_count.html.erb" } )
  end

  def word_count_form
    render( { :template => "word_count_templates/word_count_form.html.erb" } )
  end
end
