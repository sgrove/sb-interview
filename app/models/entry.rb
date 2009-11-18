class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  named_scope :active, :conditions => ["`active` = ? ", true]
  named_scope :find_by_task_group,      lambda { |group| { :conditions => ["tasks.`group` = ? ", group], :include => :task } }
  named_scope :find_within_task_id_set, lambda { |ids  | { :conditions => ["`task_id` IN (?) ", ids] } }

  # Debugging stuff, useful in the future maybe.
  named_scope :highest_level_by_group,  lambda { |group| { :conditions => ["tasks.`group` = ? ", group], :include => :task, :order => "tasks.level DESC", :select => "task.level", :limit => 1 } }
 
  def complete!
    self.completion = 100
    disable!
  end

  def disable!
    self.active = false
    save
  end
end
