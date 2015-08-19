class User < ActiveRecord::Base
  has_many :task_assignments
  has_many :tasks, through: :task_assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end

  
  def self.count_tasks_for (user)
    finished = 0
    user.tasks.each do |task|
      if task.completed == true
        finished +=1
      end
    end
    user.update(completed_tasks: finished)
  end
    

  def self.assign_task_for (user)
    if (user.tasks.count < 5) 
      n = 1#rand(1..(5-user.tasks.count))
      n.times do 
        TaskAssignment.create(
          user_id: user.id,
          task_id: rand(1..Task.count)
        )
      end
    end
  end

end
