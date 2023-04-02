# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :require_user
  before_action :set_ticket, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @ticket.comments.build(body: params[:comment][:body])
    @comment.user = current_user

    if @comment.save
      update_ticket_status
    end

    redirect_to ticket_path(@ticket)
  end

  def edit
  end

  def update
    #to-do
  end

  def destroy
    #to do
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def update_ticket_status
    @ticket.update_attribute(:status, params[:status])
  end
end
