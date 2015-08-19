class TaskAssignment < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	validates :user, :presence => true
	validates :task, :presence => true

	validates_uniqueness_of :user_id, :scope => :task_id
end
