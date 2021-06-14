class Book < ApplicationRecord
  validates :title, :content, :category, :numPage, :raiting, presence: true
  belongs_to :user
end
