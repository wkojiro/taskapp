class Task < ActiveRecord::Base
  has_many :subtasks  
  belongs_to :project
  validates :title, presence: true
  scope :unfinished, -> { where(done: false)}
  default_scope {order('updated_at DESC')}  
end
