class Task < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :users, :through => :entries

  named_scope :level, lambda { |level| { :conditions => ["tasks.`level` = ? ", level] } }
  named_scope :group, lambda { |group| { :conditions => ["tasks.`group` = ? ", group] } }
  named_scope :unique_groups, :select => "distinct tasks.`group`"
end
