# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tickets
  has_many :comments

  has_secure_password

  validates :username, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 3 }, confirmation: true
end
