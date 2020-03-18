class Bus

  def initialize(route_number, destination_long)
    @route_num = route_number
    @destination = destination_long
    @passengers = []
  end

  def drive_method()
    return "Vroom Vroom"
  end

  def route_num()
    return @route_num
  end

  def destination()
    return @destination
  end

  def passenger_count()
    return @passengers.size()
  end


  def pick_up_passenger(passenger)
    @passengers.push(passenger)
  end
  
  def drop_off_passenger(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus()
    @passengers.clear()
  end

  def pick_up_from_stop(stop)
    for person in stop.queue()
      pick_up_passenger(person)
    end
    stop.clear_queue()
  end

end
