class Subtask < ActiveRecord::Base
  belongs_to :task
  validates :memo, presence: true
  scope :unfinished, -> { where(done: false)}
  default_scope {order('updated_at DESC')}      
end
