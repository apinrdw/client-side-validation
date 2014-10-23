class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, format: {with: /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/}, if: lambda { |obj| obj.email.present? }
  validates :password, length: {minimum: 8}, if: lambda { |obj| obj.password.present? }
end
