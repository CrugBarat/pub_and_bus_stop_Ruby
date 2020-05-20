# Pub & Bus Stop

This exercise was tasked to me by CodeClan, Glasgow where I studied towards a PDA Level 8 in Professional Software Development. The exercise briefs can be found below.

**Bus Stop**

- Create a Bus class
- The Bus should have a route number and a destination
- The Bus should have a drive method that returns a string
- Create a Person class
- The Person class should have attributes of a name and age
- Give the Bus class a new property, ‘passengers'
- Add a method to the Bus class which returns how many passengers are on the bus
- Add a method to the Bus class which takes in a Person and adds it to the array of passengers
- Add a method that drops off a passenger and removes them from the array
- Add an ‘empty’ method to remove all of the passengers
- Create a new class called BusStop
- Add an attribute to the BusStop called ‘queue’
- Add a method that adds a person to the queue

**Pub**

- A Pub should have a name, a till, and a collection of drinks
- A Drink should have a name, and a price
- A Customer should have a name, and a wallet
- A Customer should be able to buy a Drink from the Pub, reducing the money in its wallet and increasing the money in the Pub’s till
- Add an age to the Customer. Make sure the Pub checks the age before serving the Customer
- Add alcohol_level to the Drink, and a drunkenness level to the Customer
- Every time a Customer buys a drink, the drunkenness level should go up by the alcohol_level
- Pub should refuse service above a certain level of drunkenness
- Create a Food class, that has a name, price and rejuvenation_level
- Each time a Customer buys Food, their drunkenness should go down by the rejuvenation_level
