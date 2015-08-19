class Task < ActiveRecord::Base
  validates :id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  #validates :completed, presence: true
  #validates :roman, presence: true
  #validates :deadline, presence: true

  has_many :task_assignments
  has_many :users, through: :task_assignments


  def self.shuffle_task_for (task)
    task.task_assignments.each do |tskas|
      tskas.update(user_id: User.maximum("completed_tasks"))
    end
  end


  def self.romanize_for (tasks)
    roman_numbers = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I',
    }

    tasks.each do |t|
      number = t.id
      result = ''
      while number > 0
        roman_numbers.each do |arab, roman|
          if number / arab >= 1
            result << roman
            number -= arab
           break
          end
        end
      end

      t.update(roman: result)
    end
  end


end
