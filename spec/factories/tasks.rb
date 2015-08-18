require 'populator'
require 'ffaker'

FactoryGirl.define do
  factory :task do |t|
    t.id 1
    t.name  { FFaker::Name.first_name }#{ [*('A'..'Z')].sample(20).join }
	t.description  { Populator.sentences(1..5) }
	t.roman ""
	t.completed true
	t.deadline "28.8.2015."
  end

end
