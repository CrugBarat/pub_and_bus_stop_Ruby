require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus.rb')
require_relative('../person.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPerson < Minitest::Test

  def setup
    @person1 = Person.new("Barry",35)
    @person2 = Person.new("Julie",22)
    @person3 = Person.new("Kovak",55)
  end

  def test_person_name()
    assert_equal("Barry",@person1.name())
  end

  def test_person_age()
    assert_equal(35,@person1.age())
  end

end
