require 'pry'
class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'
  #API_KEY = 'INVALID'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!


=begin
With an invalid API key,

# ISSUE 1: The AuthenticationError is being raised, but the `rescue Exception` in ::for_term rescues it ("catches it"), and so the method returns NoScore

# ISSUE 2: Score.for_term is returning DoesItRock::NoScore, which is assigned to score

In the case statement, score === NoScore is returning false
  #It's actually NoScore === score
  # The left-hand side is a class, so === is checking if `score` `is_a?` `NoScore`.
  # this returns false, `NoScore` is not an instance of the `NoScore` class, it's the class itself.
  # The case statement executes the `else` clause

# FIXES:
# 1: Specifically rescue a ZeroDivisionError in ::for_term, rather than rescuing any exception. Have the rescue return an instance of NoScore, so that the case statement works properly. -> This fixes the code.

# 2: Don't make subclass AuthenticationError from Exception
  # Exception is the top-most class in exception hierarchy - too broad
  # Best practice to subclass from StandardError
  # "StandardError subsumes all application-level errors."
  # "The other descendants of Exception are used for system- or environment-level errors, like memory overflows or program interruptions."
    # Definitely shouldn't rescue these type of errors.
=end