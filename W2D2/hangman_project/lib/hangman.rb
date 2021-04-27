class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
        if @attempted_chars.include?(char)
          true
        else
          false
        end
  end

  def get_matching_indices(char)
    idxs = []
    @secret_word.each_char.with_index do |ele, idx| 
      idxs << idx if ele == char
    
    end
    idxs
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end
end
