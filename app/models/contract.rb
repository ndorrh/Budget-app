class Contract < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :contract_groups, dependent: :destroy
  has_many :groups, through: :contract_groups

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
