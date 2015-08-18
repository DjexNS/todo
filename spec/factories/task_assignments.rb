FactoryGirl.define do
  factory :task_assignment do |ts|
  	ts.User 
  	ts.Task 
    ts.user_id 1
    ts.task_id 1
  end

end
