require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  fixtures :users, :tasks, :entries

  def setup
    @user     = users(:sean)
    @running  = tasks(:running_1)
    @climbing = tasks(:climbing_1)
    @fencing  = tasks(:fencing_1)
    @swimming = tasks(:swimming_1)
  end

  test "fixtures load correctly" do
    assert_equal 4, @user.tasks.count
    assert @user.tasks.collect { |t| t.name }.include?( "Running" )
    assert @user.tasks.collect { |t| t.name }.include?( "Climbing" )
    assert @user.tasks.collect { |t| t.name }.include?( "Fencing" )
    assert @user.tasks.collect { |t| t.name }.include?( "Swimming" )
    assert 1, @user.tasks.first.level
  end

  test "incomplete task group should not return complete" do
    assert_equal false, @user.task_group_level_complete( "Sports" )
  end
  
  test "task group completion" do
    assert_equal 25, @user.task_group_progress( "Sports" )
    @user.entries.find_by_task_group( "Sports" ).each { |e| e.completion = 100; e.save }
    assert_equal 100, @user.task_group_progress( "Sports" )
  end

  test "complete task group should return complete" do
    @user.entries.find_by_task_group( "Sports" ).each { |e| e.completion = 100; e.save }
    assert_equal true, @user.task_group_level_complete( "Sports" )
  end
  
end
