class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo

  def self.set_attributes
    %w[id name created_at updated_at]
  end
end
