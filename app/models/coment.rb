class Coment < ApplicationRecord
    
  belongs_to :sin
  validates :content, presence: true
  validates :name, presence: true
  
end
