class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks
  validates :title, :overview, presence: true

  def self.set_attributes
    %w[id title overview rating]
  end
end
