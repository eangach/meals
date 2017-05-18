# From: https://gist.github.com/Patru/6623747
# Needed as for Capybara >= 2.9

# put this in your test_helper.rb if you encounter the following error:

# NoMethodError: undefined method `failure_message' for Capybara::Helpers:Module
# (eval):19:in `block in assert_link'

# when using minitest-capybara with capybara 2.0.3 e.g. if you are stuck on Ruby 1.9.2
# and you will have decent error messages again

# (stolen from Capybara 2.1.0 on which minitest-capybara implicitely depends)
module Capybara
  module Helpers
    extend self
    ##
    #
    # Generates a failure message given a description of the query and count
    # options.
    #
    # @param [String] description   Description of a query
    # @option [Range] between       Count should have been within the given range
    # @option [Integer] count       Count should have been exactly this
    # @option [Integer] maximum     Count should have been smaller than or equal to this value
    # @option [Integer] minimum     Count should have been larger than or equal to this value
    #
    def failure_message(description, options={})
      message = "expected to find #{description}"
      if options[:count]
        message << " #{options[:count]} #{declension('time', 'times', options[:count])}"
      elsif options[:between]
        message << " between #{options[:between].first} and #{options[:between].last} times"
      elsif options[:maximum]
        message << " at most #{options[:maximum]} #{declension('time', 'times', options[:maximum])}"
      elsif options[:minimum]
        message << " at least #{options[:minimum]} #{declension('time', 'times', options[:minimum])}"
      end
      message
    end
  end
end
