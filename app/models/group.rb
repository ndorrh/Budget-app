class Group < ApplicationRecord
  has_many :contract_groups, dependent: :destroy
  has_many :contracts, through: :contract_groups
end
