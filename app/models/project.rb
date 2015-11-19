class Project < ActiveRecord::Base
    has_many :tasks
    validates :title, 
    presence:{ message: "タイトルを入力してください。"},
    length: {minimum: 3 , message:"タイトルは3文字以上でお願いします。"}
    default_scope {order('updated_at DESC')}     
end
