class Account < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  belongs_to :owner, polymorphic: true
  validates :owner, presence: true

  has_one :profile
  validates_associated :profile
  validates_presence_of :profile
end
