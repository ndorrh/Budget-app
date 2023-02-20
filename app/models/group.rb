class Group < ApplicationRecord
  validate :acceptable_image
  validates :category_icon, attached: true

  has_one_attached :category_icon
  has_many :contract_groups, dependent: :destroy
  has_many :contracts, through: :contract_groups
end
