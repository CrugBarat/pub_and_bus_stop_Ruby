require('minitest/autorun')
require('minitest/reporters')
require_relative('../pub.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPub < Minitest::Test

end
