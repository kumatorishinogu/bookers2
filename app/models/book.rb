class Book < ApplicationRecord
   belongs_to :user
   
   validates :title, presence: true
  validates :body, presence: true,length: {maximum: 200}
  
#   RSpec.describe Book, type: :model do
  # 省略
  
 
end
