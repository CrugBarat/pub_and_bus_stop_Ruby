require('minitest/autorun')
require('minitest/reporters')
require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../bus_stop.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBus < Minitest::Test
  #Setup method for test data
  def setup()
    @bus1 = Bus.new(22, "Ocean Terminal") #bus1 contains the collection of passeners in passenger_array
    @passenger1 = Person.new("John", 25) #We are creating a new passenger in this bus_spec.rb because we are reusing it
    @passenger2 = Person.new("Frank", 77) #2nd passenger - Note: Arrays can never go below 0.
    @stop = BusStop.new("Argyle Street")
  end

  #Testing methods which will return PASS
  def test_route_num()
    assert_equal(22,@bus1.route_num())
  end

  def test_bus_destination()
    assert_equal("Ocean Terminal",@bus1.destination())
  end

  def test_passenger_count_empty()
    assert_equal(0, @bus1.passenger_count())
  end

  #Test for picking up passenger.
  def test_pick_up_passenger()
    @bus1.pick_up_passenger(@passenger1)
    assert_equal(1, @bus1.passenger_count())
  end
  #Test for dropping off passengers.
  def test_drop_off_passenger()
    @bus1.pick_up_passenger(@passenger1)
    @bus1.pick_up_passenger(@passenger2)
    @bus1.drop_off_passenger(@passenger2)
    assert_equal(1, @bus1.passenger_count())
  end

  def test_empty_bus()
    @bus1.pick_up_passenger(@passenger1)
    @bus1.pick_up_passenger(@passenger2)
    @bus1.empty_bus()
    assert_equal(0, @bus1.passenger_count())
  end

  def test_pick_up_from_stop()
    @stop = BusStop.new("Queen Street")
    @stop.add_to_queue(@passenger1)
    @bus1.pick_up_from_stop(@stop)
    assert_equal(1, @bus1.passenger_count())
    assert_equal(0, @stop.queue_length())
  end

end
