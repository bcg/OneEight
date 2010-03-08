require File.dirname(__FILE__) + '/../ext/oneeight'
require 'bacon'

describe 'OneEight' do
  it 'should string_to_hash' do
    OneEight.string_to_hash("key").should.equal(918438112)
  end
end
