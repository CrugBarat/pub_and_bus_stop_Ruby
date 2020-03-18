class Bus
  #Constructor method
  def initialize(route_number, destination_long) #These are variables which have been assigned to instance variables below. Plus empty array is being put to proper explain initialize
    @route_num = route_number #integer #The @ makes it an instance variable
    @destination = destination_long #string
    @passengers = [] #empty array
    @num_of_passengers = 0 #integer for tracking number of passengers
  end

  #Drive method
  def drive_method()
    return "Vroom Vroom"
  end

  #Get methods
  def route_num()
    return @route_num
  end

  def destination()
    return @destination
  end

  #checks the bus array for number of passengers
  def passenger_count()
    return @passengers.size()
  end

  #Picks up passenger - passes a passenger parameter in
  def pick_up_passenger(passenger) #In Ruby, while calculations always return anyway, "return" stops the method at that line.
    @passengers.push(passenger)
  end
  #Drops off passenger. Removes 1 passenger from passenger_array.
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
