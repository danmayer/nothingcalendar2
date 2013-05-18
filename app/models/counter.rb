class Counter < ActiveRecord::Base

  attr_accessible :description, :name

  belongs_to :user

  def count
    REDIS.get(counter_key) || 0
  end

  def increment
    REDIS.incr(counter_key)
  end

  def decrement
    REDIS.decr(counter_key)
  end

  protected

  def counter_key
    "counters:counter_#{id}"
  end

end
