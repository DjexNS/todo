require 'rails_helper'

describe TaskAssignment, type: :model do
  
  it "has a valid factory" do
  	expect(FactoryGirl.create(:task_assignment)).to be_valid
  end

end
