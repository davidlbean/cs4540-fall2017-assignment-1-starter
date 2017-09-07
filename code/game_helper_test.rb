require_relative './game_helper'
require 'minitest/autorun'

# class for tests
class GameHelperTest < Minitest::Test
  def setup
    @gh = GameHelper.new
  end

  def test_that_file_is_loaded
    assert_operator @gh.all_words.word_count, :==, 351_088
  end

  def test_length_is_respected
    assert_operator @gh.all_words.with_word_length(5).count, :==, 14_847
  end

  def test_begins_with
    letters = ['f','g','i']
    selected_terms = @gh.all_words.begins_with(letters)
    # verify every selected_term begins with a member of letters
    selected_terms.each do |term|
      assert letters.include?(term[0])
    end
  end

  def test_contains
    letters = ['f', 'g', 'i']
    selected_terms = @gh.all_words.contains( letters )
    # verify every selected_term contains at least one member of letters
    letters_slammed = letters.join
    selected_terms.each do |term|
      assert term.match(/[#{letters_slammed}]/), "#{term} does not contain #{letters.join(',')}"
      end
  end

  def test_does_not_contain
    letters = ['x', 'y', 'z']
    selected_terms = @gh.all_words.does_not_contain(letters)
    # verify every selected_term contains none of letters
    letters_slammed = letters.join
    selected_terms.each do |term|
      assert term.match(/\A[^#{letters_slammed}]*\z/), "the term >#{term}< contains #{letters.join(',')}"
    end
  end

  # 5-letter words that start with 'e' and do not contain 'x'
  def test_case_1
    terms = @gh.all_words.with_word_length(5).begins_with('e').does_not_contain('x')
    assert(terms.all? { |term| term.size == 5 && term.match(/\Ae[^x]{4}\z/) })
  end

  # 6-letter words that begin with either 'e' or 'a' and do not contain 'y' and 'i'
  def test_case_2
    terms = @gh.all_words.with_word_length(6).begins_with('e', 'a').does_not_contain('y', 'i')
    assert(terms.all? { |term| term.size == 6 && term.match(/\A[ea][^iy]{5}\z/) })
  end

  # 6-letter words that begin with 'e', have only one 'e' and don't contain 'y'
  def test_case_3
    terms = @gh.all_words.with_word_length(6).begins_with('e').char_count_less_than('e', 2).does_not_contain('y')
    assert(terms.all? { |term| term.size == 6 && term.match(/\Ae[^ey]{5}\z/) })
  end

  # 4- or 5-letter words that contain 'y' but don't end with 'y'
  def test_case_4
    terms = @gh.all_words.with_word_length(4,5)..does_not_end_with('y')
    assert(terms.all? { |term| [4, 5].include?(term.size) && term.match(/y/) && term.match(/[^y]\z/) })
  end

  # TODO:  write a test that verifies:
  # 8-letter words that begin with 't' and end with 'ey'
  def test_case_5
    assert false
  end

  # TODO:  write a test that verifies:
  # there are no three letter words that begin with 'z' and end with 'f'
  def test_case_6
    assert false
  end

  # TODO:  write a test that verifies:
  # there are four three letter words that begin with 'e' and end with 'g'
  def test_case_7
      assert false
  end
end
