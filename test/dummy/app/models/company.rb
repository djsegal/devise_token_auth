class Company < ActiveRecord::Base
  has_one :account, as: :owner

  validates :other_field, presence: true
end
