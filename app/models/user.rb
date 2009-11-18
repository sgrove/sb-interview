class User < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :tasks, :through => :entries

  def task_group_progress group
    entries.find_by_task_group( group ).inject(0) { |sum, e| sum += e.completion } / 4 # 4 tasks per group
  end

  def task_group_level_complete group
    task_group_progress( group ) == 100
  end

  def mark_group_complete group
    entries.find_by_task_group( group ).each { |e| e.complete! }
  end
end
