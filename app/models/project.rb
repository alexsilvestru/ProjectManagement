# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def self.options_for_select
    Project.all.map do |project|
      [project.name, project.id]
    end
  end
end
