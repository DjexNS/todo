require 'populator'
require 'ffaker'

FactoryGirl.define do
  factory :task do |t|
    t.id 1
    t.name  { FFaker::Name.first_name }#{ [*('A'..'Z')].sample(20).join }
	t.description { Populator.sentences(1..5) }
	t.roman "I"
	t.completed true
	t.deadline "2015-08-30 16:30"
  end

  factory :user do |t|
    t.name { FFaker::Name.first_name }
    t.email  { FFaker::Internet.email }
    t.password "12345678"
  end

end
