class Sin < ApplicationRecord
  has_many :coments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
