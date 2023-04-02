# frozen_string_literal: true

class Ticket < ApplicationRecord
  STATUS = %w[pending in_progress done]

  belongs_to :project
  belongs_to :user, foreign_key: 'user_id'

  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :project_id, presence: true
  validates :user_id, presence: true

  def sort_comments
    self.comments.sort_by { |comment| comment.updated_at }.reverse
  end

  scope :filter_by_project, -> (id) { where('project_id = ?', id) }
  scope :filter_by_status, -> (status) { where('status = ?', status) }
end
