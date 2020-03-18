require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCustomer < Minitest::Test

end
