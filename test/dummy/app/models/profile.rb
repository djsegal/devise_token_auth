class Profile < ActiveRecord::Base
  belongs_to :account
  validates :account, presence: true

  validates :other_field, presence: true
end
