# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  include LikeSearchable
  include Paginatable

  validates :name, presence: true
  validates :profile, presence: true

  enum profile: { admin: 0, client: 1 }
end
