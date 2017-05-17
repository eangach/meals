ENV['RACK_ENV'] = 'test'

lib_dir = File.expand_path File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include? lib_dir

require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'meals'
