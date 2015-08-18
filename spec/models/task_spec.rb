require 'rails_helper'

describe Task, type: :model do

  it "has a valid factory" do
  	expect(FactoryGirl.create(:task)).to be_valid
  end

  it "is invalid without an id" do
    expect(FactoryGirl.build(:task, id: nil)).to_not be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:task, name: "")).to_not be_valid
  end


  it "is invalid without a description" do
    expect(FactoryGirl.build(:task, description: "")).to_not be_valid
  end


  it "is invalid without a completed status" do
    expect(FactoryGirl.build(:task, completed: nil)).to_not be_valid
  end


  it "is invalid without a roman presentation" do
    expect(FactoryGirl.build(:task, roman: nil)).to_not be_valid
  end


  it "is invalid without a deadline mark" do
    expect(FactoryGirl.build(:task, description: nil)).to_not be_valid
  end

=begin

	*ne znam kako istestirati ovu metodu, kao argument prima kolekciju
	objekata i onda menja svakog od njih

  it "returns a romanized number" do
  	t1 = FactoryGirl.build(:task, id:1)
  	t2 = FactoryGirl.build(:task, id:2)
  	t3 = FactoryGirl.build(:task, id:3)
  	t = [t1, t2, t3]

  	expect(Task.romanize_for(t)).to change([t...])
  end

=end

#  it "shuffles a task to a different user" do
#  	t = FactoryGirl.build(:task)
    
#    expect(t).to_not be_valid
#  end




end
