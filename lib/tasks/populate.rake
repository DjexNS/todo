namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'ffaker'
    
    [Task].each(&:delete_all)
    
    Task.populate 30 do |t|
      name_length=rand(15..25)
      t.name = [*('A'..'Z')].sample(name_length).join
      t.description = Populator.sentences(1..5)
    end

  end
end

