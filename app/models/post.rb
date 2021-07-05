class Post < ApplicationRecord
  belongs_to :user
  has_many :movies, dependent: :destroy
  accepts_nested_attributes_for :movies
end
