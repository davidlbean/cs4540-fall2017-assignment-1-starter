
# This class is probably overkill, but I'm including it here
# to illustrate how you'd define your own class.
class GameHelper
  # normally, instance variables (those that being with an @)
  # are not accessible outside the object.  Ruby provides helper
  # macros to provide getters and setters.  Here, I'm using
  # attr_reader to create a getter function.  The format for these
  # kinds of macros is to follow the macro name with a symbol
  # that matches the instance variable name without the @.
  attr_reader :all_words

  # note that I could also have called attr_writer here to
  # create a setter function for the @all_words instance variable,
  # or I could have called attr_accessor to create both getter
  # and setter at once.  How does all this magic happen?
  # During evaluation of the class, the ruby injects the
  # getter and setter functions into the class definition for you.

  # this is the object constructor...defined as the constructor
  # by virtue of its name, initialize.
  def initialize(fname = '../data/SINGLE.TXT')
    # read in the data
    f = File.open(fname, 'r')

    # File::readlines will return an array of lines
    @all_words = f.readlines
    # notice how I didn't have to declare the
    # @all_words variable ahead of assigning it.

    # remove the line returns and such
    @all_words.map! { |term| term.strip }
    # see how I used map! instead of map...I wanted
    # the mapping to change the object I called it on.

    # remove any words with internal punctuation
    @all_words.delete_if do |term|
      term.match(/\W/)
    end
  end

  def count_of_terms
    @all_words.size
  end
end

# In class, we originally started defining member functions on the
# GameHelper class to search the word lists for operations like
# begins_with and does_not_contain.  That's reasonable, but what that
# design won't support is the chaining of those operations.  For
# example, I might want to find all the 5 letter words that begin
# with 'e' but do not contain 'x'.  But, in order to do that, each of
# those operations will need to take as input the results of the prior
# operation.  While we *could* do that with our GameHelper class,
# it's far simplier to use modify the built-in Array class with our
# own functionality.
#
# This is why I used attr_reader :all_words in the GameHelper
# class.  That allows me to get at the @all_words instance variable
# within GameHelper (which is an Array object) so I can call our
# added operators on it directly...which gives me chaining.
#
# To be more specific, by defining these operations on the Array
# class, I can now do this:
#
#  my_array.with_word_length(5).begins_with('e').does_not_contain('x')
#
class Array
  # filter the words to only those with size at least one of the lengths
  def with_word_length(*list_of_possible_lengths)
    self.select { |term| list_of_possible_lengths.any?{ |len| term.length == len }}
  end

  # filter the words to only those that start with
  # at least one of the passed-in letters
  # TODO: Refactor this function to take an unconstrained
  # number of parameters, i.e. so it will return any words
  # that begin with any of the passed in characters instead
  # of a single character.
  def begins_with(letter)
    self.select do |term|
      term[0] == letter
    end
  end

  def ends_with(*list_of_possible_letters)
    self.select do |term|
      list_of_possible_letters.any? do |letter|
        letter == term[-1]
      end
    end
  end

  # filter the words to only those that contain
  # at least one of the passed-in letters
  def contains(*list_of_possible_letters)
    # TODO:  code this
  end

  # filter the words to only those that do not
  # contain any of the passed-in letters
  def does_not_contain(*list_of_possible_letters)
    self.select do |term|
      list_of_possible_letters.none? do |letter|
        term.match(/#{letter}/)
      end
    end
  end

  def does_not_begin_with(*list_of_possible_letters)
    # TODO:  code this
  end

  def does_not_end_with(*list_of_possible_letters)
    # TODO:  code this
  end

  # Syntactic sugar - just offering the existing Array count function
  # under a name that makes more sense for our use case.
  # There's another way to do this, btw. Look up how Ruby supports aliasing.
  def word_count
    self.count
  end

  def char_count_less_than(char, len)
    select do |term|
      term.contains_count(char) < len
    end
  end




end

# Here's another example of adding functionality to an existing
# class definition.  We'll crack open the String class and add
# our own contains_count function to it.
class String
  # how many times does the passed-in char occur
  # in the string?
  def contains_count(char)
    self.scan(/#{char}/).count
  end
end
